class ChangeStringToTextOnVenueDescription < ActiveRecord::Migration[7.1]
  def change
    change_column :venues, :description, :text
  end
end
