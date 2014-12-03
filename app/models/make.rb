class Make < ActiveRecord::Base
  has_many :advertisments
  has_many :models
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
