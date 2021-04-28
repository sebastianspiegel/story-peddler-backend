class StoriesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index 
        stories = Story.all 
        render json: StorySerializer.new(stories)
    end

    def show
        story = Story.find(params[:id])
        render json: story.to_json(include: [:characters, :plot_points])
    end

    def create
        story = Story.new(story_params)
        if story.save
            render json: {
                story: story,
                success: true
            }
        else
            render json: {message: "failed to create"}
        end
    end

    def destroy
        story = Story.find(params[:id])
        story.destroy
        render json: {message: "#{story.title} has been deleted"}
    end

    def update 
        story = Story.find(params[:id])
        if story.update(story_params)
            render json: StorySerializer.new(story)
        else
            render json: {error: "failed to update"}
        end
    end

    private

    def story_params
        params.require(:story).permit(:title, :genre, :summary, :user_id)
    end
end
