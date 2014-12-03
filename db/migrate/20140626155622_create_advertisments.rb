class CreateAdvertisments < ActiveRecord::Migration
  def change
    create_table :advertisments do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.belongs_to :user
      t.belongs_to :type
      t.belongs_to :resource, polymorphic: true
      t.timestamps
    end
  end
end
