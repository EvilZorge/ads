class AddPriceToAdvertisments < ActiveRecord::Migration
  def change
    add_column :advertisments, :price, :string, null: false
    add_index :advertisments, :price
  end
end
