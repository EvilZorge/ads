class Car < ActiveRecord::Base
  belongs_to :country
  belongs_to :city
  belongs_to :condition
  belongs_to :style
  belongs_to :mileage
  belongs_to :year
  belongs_to :engine
  belongs_to :engine_volume
  belongs_to :door
  belongs_to :color
  belongs_to :transmission
  belongs_to :make
  belongs_to :model
  belongs_to :advertisment
  has_and_belongs_to_many :features
  # accepts_nested_attributes_for :advertisment, allow_destroy: true
end
