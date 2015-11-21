class User < ActiveRecord::Base

    # capital represents constants
    VALID_EMAIL_REGEX = /[(0-9a-zA-Z)+\-\.]+@[(0-9a-zA-Z)+\-\.]+\.[a-z]+/i

    before_save { self.email = email.downcase }

    validates :name, presence: true, length: {maximum: 32}
    validates :email, presence: true, length: {maximum: 128},
        format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

    has_secure_password
end
