class Story < ApplicationRecord
    has_many :characters
    has_many :plot_points 
end
