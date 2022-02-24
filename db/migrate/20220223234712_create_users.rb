class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.integer :access
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.text :activity_preferences

      t.timestamps
    end
  end
end
