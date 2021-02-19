class Story < ApplicationRecord
    has_many :characters, dependent: :destroy
    has_many :plot_points, dependent: :destroy

    validates :title, presence: true
end
