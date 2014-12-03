class AddMileageToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :mileage, index: true
  end
end
