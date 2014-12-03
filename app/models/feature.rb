class Feature < ActiveRecord::Base
  has_and_belongs_to_many :advertisments
  validates :name, presence: true, length: { maximum: 180 }, uniqueness: true
end
