class Country < ActiveRecord::Base
  has_many :advertisments
  has_many :cities
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
