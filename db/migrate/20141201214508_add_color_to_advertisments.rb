class AddColorToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :color, index: true
  end
end
