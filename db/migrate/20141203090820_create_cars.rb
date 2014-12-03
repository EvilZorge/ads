class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.belongs_to :make
      t.belongs_to :model
      t.belongs_to :country
      t.belongs_to :city
      t.belongs_to :condition
      t.belongs_to :style
      t.belongs_to :mileage
      t.belongs_to :year
      t.belongs_to :engine
      t.belongs_to :engine_volume
      t.belongs_to :transmission
      t.belongs_to :door
      t.belongs_to :color
      t.string :price

    end
  end
end
