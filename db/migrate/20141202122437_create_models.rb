class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.belongs_to :make, index: true
      t.index :name, :unique => true
    end
  end
end
