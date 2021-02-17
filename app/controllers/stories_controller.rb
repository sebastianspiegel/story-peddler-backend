class StoriesController < ApplicationController
    has_many :characters 
    has_many :plot_points 
end
