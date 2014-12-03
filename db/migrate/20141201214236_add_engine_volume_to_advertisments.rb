class AddEngineVolumeToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :engine_volume, index: true
  end
end
