class AddMakeToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :make, index: true
  end
end
