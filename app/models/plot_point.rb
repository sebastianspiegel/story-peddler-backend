class PlotPoint < ApplicationRecord
  belongs_to :story

  validates :description, presence: true

  after_create do
    # !!self.order ? self.order = self.story.plot_points.count : self.order 
    self.order = self.story.plot_points.count 
  end


end
