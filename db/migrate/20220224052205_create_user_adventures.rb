class CreateUserAdventures < ActiveRecord::Migration[5.2]
  def change
    create_table :user_adventures do |t|
      t.references :user, foreign_key: true
      t.references :adventure, foreign_key: true

      t.timestamps
    end
  end
end
