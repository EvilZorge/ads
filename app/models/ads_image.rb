class AdsImage < ActiveRecord::Base
  belongs_to :advertisment
  has_attached_file :photo,
    styles: { medium: '400x400>', small: '150x150>' },
    url: '/assets/ads_image/:id/:style/:basename.:extension',
    path: ':rails_root/public/assets/ads_image/:id/:style/:basename.:extension'

  validates_attachment :photo,
    content_type:  { content_type: ['image/jpeg', 'image/png'] }
end
