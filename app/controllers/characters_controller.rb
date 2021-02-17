class CharactersController < ApplicationController
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
            render json: CharacterSerializer.new(character)
        else
            render json: {error: "failed to save"}
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
            render json: {error: "failed to update"}
        end
    end

    private

    def character_params
        params.require(:character).permit(:name, :description, :story_id)
    end
end
