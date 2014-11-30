class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.belongs_to :country, index: true
      t.index :name, :unique => true
    end
  end
end
