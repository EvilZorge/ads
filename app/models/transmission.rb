class Transmission < ActiveRecord::Base
  has_many :advertisments
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
