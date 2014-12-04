class User < ActiveRecord::Base
  extend Enumerize
  has_many :advertisments, dependent: :destroy
  has_many :comments
  has_many :reviews, class_name: "Review", foreign_key: "assignee_id"
  has_many :feedbacks, class_name: "Review", foreign_key: "user_id"
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :role, presence: true
  validates :nickname, presence: true, length: { minimum: 3,  maximum: 30 }
  validates :name, presence: true, length: { minimum: 3,  maximum: 30 }
  validates :surname, presence: true, length: { minimum: 3,  maximum: 30 }
  enumerize :role, in: [:user, :admin], default: :user

  def fullname
    name.titleize + ' '+ surname.titleize
  end
end
