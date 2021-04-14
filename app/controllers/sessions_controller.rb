class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: session_params[:username])
        if @user && @user.authenticate(session_params[:password])
            # login!
            session[:user_id] = @user.id
            render json: {
                logged_in: true,
                user: @user
            }
        else
            render json: {
                status: 401,
                errors: ['no such user, please try again']
            }
        end
    end

    def is_logged_in?
        if !!session[:user_id] && current_user
            render json: {
                logged_in: true,
                user: current_user
            }
        else
            render json: {
                logged_in: false,
                message: 'no such user'
            }
        end
    end

    def destroy
        logout!
        byebug
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