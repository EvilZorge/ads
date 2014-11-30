class City < ActiveRecord::Base
  has_many :advertisments
  belongs_to :country
end
