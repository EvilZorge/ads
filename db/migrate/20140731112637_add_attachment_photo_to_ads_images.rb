class AddAttachmentPhotoToAdsImages < ActiveRecord::Migration
  def self.up
    change_table :ads_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :ads_images, :photo
  end
end
