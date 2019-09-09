class UsersController < ApplicationController
    def new
        @user = User.new
    end 

    def edit
    end

    def create
       
    end

    def update
    end

    def login
        render :login
    end 
end 