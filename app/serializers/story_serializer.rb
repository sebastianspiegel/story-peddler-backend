class StorySerializer
    include FastJsonapi::ObjectSerializer

    attributes :title, :genre, :summary

    has_many :characters
    has_many :plot_points

end