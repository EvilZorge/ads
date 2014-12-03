class CreateCarFeatures < ActiveRecord::Migration
  def change
    create_table :car_features do |t|
      t.belongs_to :car
      t.belongs_to :feature
    end
  end
end
