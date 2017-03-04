class AddLocationToFloods < ActiveRecord::Migration
  def change
    add_column :floods, :location, :text
  end
end
