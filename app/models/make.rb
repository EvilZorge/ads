class Make < ActiveRecord::Base
  has_many :cars
  has_many :models
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
