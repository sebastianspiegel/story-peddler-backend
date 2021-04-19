class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    # def index 
    #     users = User.all 
    #     render json: StorySerializer.new(stories)
    # end

    # def show
    #     story = Story.find(params[:id])
    #     render json: story.to_json
    # end

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
            render json: {message: "failed to create"}
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