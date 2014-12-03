class AddYearToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :year, index: true
  end
end
