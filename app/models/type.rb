class Type < ActiveRecord::Base
  before_destroy :check_can_delete
  has_many :advertisments
  validates :name, presence: true, length: { maximum: 20 }
end
