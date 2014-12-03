class Mileage < ActiveRecord::Base
  has_many :cars
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
