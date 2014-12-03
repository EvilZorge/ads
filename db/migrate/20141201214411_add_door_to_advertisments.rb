class AddDoorToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :door, index: true
  end
end
