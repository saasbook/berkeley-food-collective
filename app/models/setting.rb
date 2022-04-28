require 'bcrypt'

class Setting < ApplicationRecord
    include BCrypt

    def password
        @password ||= Password.new(admin_password_hash)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.admin_password_hash = @password
    end
end
