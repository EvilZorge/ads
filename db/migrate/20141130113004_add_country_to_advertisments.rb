class AddCountryToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :country, index: true
  end
end
