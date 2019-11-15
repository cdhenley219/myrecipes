class SessionsController < ApplicationController
    def new
        #render login page here
    end 

    def create
        #look up user by email and convert to lowercase to match email in db
        user = User.find_by(email: params[:login][:email].downcase)

        #verify user exists in db and run has_secure_password's authenticate()
        #to see if password submitted was correct
        if user && user.authenticate(params[:login][:password])
            #save the user.id in user's session cookie
            session[:user_id] = user.id.to_s
            redirect_to root_path, notice: 'Successfully logged in!'
        else 
            #re-render login page on incorrect email or password
            flash.now.alert = 'Incorrect email or password, try again.'
            render :new
        end 
    end

    def destroy
        # delete the saved user_id key/value from the cookie:
        session.delete(:user_id)
        redirect_to login_path, notice: "Logged out!"
    end 
end
