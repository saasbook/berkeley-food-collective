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

    def auth 
        @setting = Setting.find(__)
        if @setting.password == params[:password]
            redirect_to settings_path
        else
            flash[:danger] = "incorrect password!"
            redirect_to admin_auth_path
        end
    end
end
