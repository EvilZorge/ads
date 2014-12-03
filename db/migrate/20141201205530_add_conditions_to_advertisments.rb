class AddConditionsToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :condition, index: true
  end
end
