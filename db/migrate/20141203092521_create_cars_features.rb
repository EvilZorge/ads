class CreateCarsFeatures < ActiveRecord::Migration
  def change
    create_table :cars_features do |t|
      t.belongs_to :car
      t.belongs_to :feature
    end
  end
end
