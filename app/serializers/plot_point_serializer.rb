class PlotPointSerializer
    include FastJsonapi::ObjectSerializer

    attributes :description, :story_id

    belongs_to :story 

end