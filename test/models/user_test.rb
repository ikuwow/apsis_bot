require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup
        @user = User.new(
            name: "testuser",
            email: "testuser@example.com",
            password: "somepassword"
        )
    end

    test "should be valid" do
        assert @user.valid?
    end

end
