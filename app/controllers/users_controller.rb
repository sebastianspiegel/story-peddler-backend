class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    # def index 
    #     users = User.all 
    #     render json: StorySerializer.new(stories)
    # end

    def show
        user = User.find(params[:id])
        # render json: {
        #     # user.to_json(include: :stories, except: :password_digest)
        #     user: user,
        #     stories: user.stories,
        #     success: true
        # }
        render json: user.to_json(include: :stories, except: :password_digest)
    end

    def create
        user = User.new(user_params)
        if user.save
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                user: user,
                jwt: token,
                success: true
            }
        else
            render json: {message: "Unable to creat account. Please make sure your username is at least 4 characters long and your passwords match."}
        end
    end

    # def destroy
    #     story = Story.find(params[:id])
    #     story.destroy
    #     render json: {message: "#{story.title} has been deleted"}
    # end

    # def update 
    #     story = Story.find(params[:id])
    #     if story.update(story_params)
    #         render json: StorySerializer.new(story)
    #     else
    #         render json: {error: "failed to update"}
    #     end
    # end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end