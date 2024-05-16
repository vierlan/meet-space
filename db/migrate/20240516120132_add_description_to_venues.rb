class AddDescriptionToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :description, :text
  end
end
