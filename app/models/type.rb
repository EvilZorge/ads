class Type < ActiveRecord::Base
  has_many :advertisments
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
end
