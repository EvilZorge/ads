class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body, null: false
      t.belongs_to :user
      t.belongs_to :assignee 
      t.timestamps
    end
  end
end
