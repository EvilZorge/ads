class CreateEngineVolumes < ActiveRecord::Migration
  def change
    create_table :engine_volumes do |t|
      t.string :name
      t.index :name, :unique => true
    end
  end
end
