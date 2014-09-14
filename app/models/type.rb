class Type < ActiveRecord::Base
  before_destroy :check_can_delete
  has_many :advertisments
  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
end
