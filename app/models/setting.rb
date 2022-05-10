require 'bcrypt'

class Setting < ApplicationRecord
    include BCrypt
    attr_accessor :new_password
    validates_confirmation_of :new_password
    validates :new_password, :new_password_confirmation, presence: true, on: :update_password

    def password
        @password ||= Password.new(admin_password_hash)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.admin_password_hash = @password
    end
end
