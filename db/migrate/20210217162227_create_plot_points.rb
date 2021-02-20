class CreatePlotPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :plot_points do |t|
      t.string :description
      t.integer :order
      t.belongs_to :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
