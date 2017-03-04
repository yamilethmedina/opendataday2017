class AddAddressToFloods < ActiveRecord::Migration
  def change
    add_column :floods, :address, :string
  end
end
