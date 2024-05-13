class CreateVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :facilities
      t.string :address
      t.string :category
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
