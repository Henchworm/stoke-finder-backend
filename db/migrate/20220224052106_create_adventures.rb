class CreateAdventures < ActiveRecord::Migration[5.2]
  def change
    create_table :adventures do |t|
      t.text :guest_email_addresses
      t.datetime :date
      t.text :comment
      t.text :activities
      t.boolean :favorite
      t.integer :rec_area_id

      t.timestamps
    end
  end
end
