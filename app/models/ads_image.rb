class AdsImage < ActiveRecord::Base
  belongs_to :advertisment
  has_attached_file :photo,
    styles: { medium: '400x400#', small: '150x150#', thumb: '50x50#' },
    url: '/assets/ads_images/:id/:style/:basename.:extension',
    :default_url =>  "/assets/ads_images/missing_thumb.png"

  validates_attachment :photo,
    content_type:  { content_type: ['image/jpeg', 'image/png'] }
end