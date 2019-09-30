class UsersController < ApplicationController
    def new
        @user = User.new
    end 

    def edit
        @user = User.find (params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #temp - redirect to root, will eventually login from here
            redirect_to root_url
        else
            render :new
        end   
    end

    def update
        @user = User.find (params[:id])
        if @user.update (user_params)
            redirect_to root_url
            #redirect_back fallback_location: root_url
        else 
            render :edit
        end 
    end

    private 
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end 