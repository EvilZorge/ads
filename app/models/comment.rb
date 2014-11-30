class Comment < ActiveRecord::Base
  belongs_to :advertisment
  belongs_to :user

  validates :body, presence: true, length: { minimum: 3,  maximum: 180 }
end
