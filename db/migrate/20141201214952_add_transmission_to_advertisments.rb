class AddTransmissionToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :transmission, index: true
  end
end
