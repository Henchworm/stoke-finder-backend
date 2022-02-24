class CreateCustomRecAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_rec_areas do |t|
      t.string :name
      t.string :longitude
      t.string :latitude
      t.string :activities
      t.text :comments
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
