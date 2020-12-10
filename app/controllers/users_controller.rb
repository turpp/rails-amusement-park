class UsersController < ApplicationController
    def new
        @user=User.new
    end

    def create
        user=User.create(user_params)
        session[:user_id]=user.id
        redirect_to user_path(user)
    end

    def home
    
    end

    def show
        if session[:user_id]==params[:id].to_i
        @user=User.find_by(id: params[:id])
        else
        redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end
