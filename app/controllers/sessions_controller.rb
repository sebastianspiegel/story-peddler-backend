class SessionsController < ApplicationController

    def create
        user = User.find_by(username: session_params[:username])
        if user && user.authenticate(session_params[:password])
            # login 
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                user: user,
                jwt: token,
                logged_in: true 
            }
        else
            render json: {message: "Log in error. Password or username invalid."}
        end
    end

    def is_logged_in?
        if session_user
            render json: session_user
        else
            render json: {message: "No user is logged in."}
        end
        # if !!session[:user_id] && current_user
        #     render json: {
        #         logged_in: true,
        #         user: current_user
        #     }
        # else
        #     render json: {
        #         logged_in: false,
        #         message: 'no such user'
        #     }
        # end
    end

    def destroy
        logout!
        render json: {
            status: 200,
            logged_out: true
        }
    end

    private

    def session_params
        params.require(:user).permit(:username, :password)
    end
end