class CreateTransmissions < ActiveRecord::Migration
  def change
    create_table :transmissions do |t|
      t.string :name
      t.index :name, :unique => true
    end
  end
end
