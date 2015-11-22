require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup
        @user = User.new(
            name: "testuser",
            email: "testuser@example.com",
            password: "foobar12", password_confirmation: "foobar12"
        )
    end

    test "should be valid" do
        assert @user.valid?
    end

    test "name should be present" do
        @user.name = "   "
        assert_not @user.valid?
    end

    test "email should be present" do
        @user.email = " "
        assert_not @user.valid?
    end

    test "name should not be too long" do
        @user.name = "a" * 33
        assert_not @user.valid?
    end

    test "email should not be too long" do
        @user.email = "a" * 129
        assert_not @user.valid?
    end

    test "email should accept valid addresses" do
        %w{ user@example.com USER@foo.COM A_US-ER@foo.bar.org
            first.last@foo.jp alice+bob@baz.cn }.each do |address|
            @user.email = address
            # Adding validation message
            assert @user.valid?, "#{address.inspect} should be valid"
        end
    end

    test "email validation should reject invalid addresses" do
        invalid_addresses = %w{user@example,com user_at_foo.org user.name@example.}
        invalid_addresses.each do |address|
            @user.email = address
            assert_not @user.valid?, "#{address.inspect} should be invalid"
        end
    end

    test "email addresses should be unique" do
        duplicate_user = @user.dup
        @user.save
        assert_not duplicate_user.valid?
    end

    test "password should be present (non blank)" do
        @user.password = @user.password_confirmation = " " * 8
        assert_not @user.valid?
    end

    test "password should have a minimum length" do
        @user.password = @user.password_confirmation = "a" * 7
        assert_not @user.valid?
    end

end
