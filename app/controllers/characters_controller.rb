class CharactersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index 
        characters = Character.all 
        render json: CharacterSerializer.new(characters)
    end

    def show
        character = Character.find(params[:id])
        render json: character.to_json
    end

    def create
        character = Character.new(character_params)
        if character.save
            render json: {message: "#{character.name} has been created!", success: true}
        else
            render json: {message: "failed to save", success: false}
        end
    end

    def destroy
        character = Character.find(params[:id])
        character.destroy
        render json: {message: "#{character.name} has been deleted"}
    end

    def update 
        character = Character.find(params[:id])
        if character.update(character_params)
            render json: CharacterSerializer.new(character)
        else
            render json: {message: "failed to update"}
        end
    end

    private

    def character_params
        params.require(:character).permit(:name, :description, :story_id)
    end
end
