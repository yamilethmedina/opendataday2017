class CreateFloods < ActiveRecord::Migration
  def change
    create_table :floods do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :date_of_report
      t.text :description
      t.string :latitude
      t.string :longitude
      t.decimal :salinity
      t.string :salinity_units
      t.decimal :water_depth
      t.string :water_depth_units

      t.timestamps
    end
  end
end
