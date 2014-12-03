class Model < ActiveRecord::Base
  has_many :advertisments
  belongs_to :make
end
