class AddCityToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :city, index: true
  end
end
