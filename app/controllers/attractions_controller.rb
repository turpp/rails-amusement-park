class AttractionsController < ApplicationController

    def new
        @attraction=Attraction.new

    end 

    def create
        # byebug
        @attraction=Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)

    end

    def edit
        @attraction=Attraction.find_by(id: params[:id])

    end

    def update
        # byebug
        a=Attraction.find_by(id: params[:id])
        a.update(attraction_params)
        redirect_to attraction_path(a)
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

    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
