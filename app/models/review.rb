class Review < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :assignee, class_name: "User"

  validates :body, presence: true, length: { minimum: 3,  maximum: 180 }
end
