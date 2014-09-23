class CreateAdsImages < ActiveRecord::Migration
  def change
    create_table :ads_images do |t|
      t.belongs_to :advertisment
      t.timestamps
    end
  end
end
