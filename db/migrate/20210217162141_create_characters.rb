class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :description
      t.belongs_to :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
