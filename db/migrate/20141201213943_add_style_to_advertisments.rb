class AddStyleToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :style, index: true
  end
end
