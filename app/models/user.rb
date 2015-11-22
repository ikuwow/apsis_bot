class User < ActiveRecord::Base

    # capital represents constants
    VALID_EMAIL_REGEX = /[(0-9a-z)+\-\.]+@[(0-9a-z)+\-\.]+\.[a-z]+/i

    before_save { email.downcase! }

    validates :name, presence: true, length: {maximum: 32}
    validates :email, presence: true, length: {maximum: 128},
        format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 8 }

    has_secure_password

end
