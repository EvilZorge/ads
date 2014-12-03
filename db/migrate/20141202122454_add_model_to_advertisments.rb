class AddModelToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :model, index: true
  end
end
