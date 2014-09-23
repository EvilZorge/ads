class AdvertismentSerializer
  extend Forwardable

  def_delegators :@advertisment, :id,:title, :type, :ads_images

  def initialize(advertisment)
    @advertisment = advertisment
  end

  def self.serialize_collection(advertisments)
    advertisments.map { |advertisment| self.new(advertisment) }
  end

  def as_json(*)
    {
      id: id,
      title: title,
      type: type.name,
      photo: photo
    }
  end

  def photo
    if ads_images.any?
      ads_images.first.photo.url(:thumb)
    else
      "/assets/ads_images/missing_thumb.png"
    end
  end

end
