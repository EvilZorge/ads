class AddEngineToAdvertisments < ActiveRecord::Migration
  def change
    add_reference :advertisments, :engine, index: true
  end
end
