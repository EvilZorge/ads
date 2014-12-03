class CreateMileages < ActiveRecord::Migration
  def change
    create_table :mileages do |t|
      t.string :name
      t.index :name, :unique => true
    end
  end
end
