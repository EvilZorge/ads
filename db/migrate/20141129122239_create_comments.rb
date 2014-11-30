class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :advertisment
      t.belongs_to :user
      t.timestamps
    end
  end
end
