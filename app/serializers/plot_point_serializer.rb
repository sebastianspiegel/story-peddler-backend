class PlotPointSerializer
    include FastJsonapi::ObjectSerializer

    attributes :description, :order, :story_id

    belongs_to :story 

end