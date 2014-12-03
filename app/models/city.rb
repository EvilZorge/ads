class City < ActiveRecord::Base
  has_many :cars
  belongs_to :country
end
