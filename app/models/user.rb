class User < ActiveRecord::Base
  extend Enumerize
  has_many :advertisments, dependent: :destroy
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  enumerize :role, in: [:user, :admin], default: :user
end
