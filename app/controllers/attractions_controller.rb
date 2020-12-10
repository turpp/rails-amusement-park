class AttractionsController < ApplicationController

    def new


    end 

    def create

    end

    def edit

    end
    def index 
        @attractions=Attraction.all
        @user=User.find_by(id: session[:user_id])

    end

    def show
        @attraction=Attraction.find_by(id: params[:id])
        @user=User.find_by(id: session[:user_id])

    end

    def go_on_ride
      
        # user=User.find_by(sessions[:user_id])
        # attraction=Attraction.find_by(params[:attraction_id])
        # ride=Ride.create(attraction_id: params[:attraction_id], user_id: session[:user_id])
        ride=Ride.create(attraction_id: params[:attraction_id], user_id: params[:user_id])
# byebug
        # if ride.user
        # ride.take_ride
        
        #tickets
        #mood
        redirect_to user_path(session[:user_id]), notice: ride.take_ride
    end
end
