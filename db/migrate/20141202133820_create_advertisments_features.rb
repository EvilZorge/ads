class CreateAdvertismentsFeatures < ActiveRecord::Migration
  def change
    create_table :advertisments_features do |t|
      t.belongs_to :advertisment
      t.belongs_to :feature
    end
  end
end
