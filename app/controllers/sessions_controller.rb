class SessionsController < ApplicationController

    def new
        @users=User.all
        @user=User.new
    end

    def create 
        # byebug
        user=User.find_by(id: params[:user][:name].to_i)
        if user
            if user.authenticate(params[:user_password])
                session[:user_id]=user.id
                redirect_to user_path(user)
            else
                redirect_to signin_path, alert: "Incorrect Password"
            end
        else
            redirect_to signin_path, alert: "Can't Find User"
        end

    end

    def logout
       reset_session
        redirect_to root_path
    end
end