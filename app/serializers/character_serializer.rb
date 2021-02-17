class CharacterSerializer
    include FastJsonapi::ObjectSerializer

    attributes :name, :description, :story_id

    belongs_to :story 

end