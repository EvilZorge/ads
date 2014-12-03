class Advertisment < ActiveRecord::Base
  extend Enumerize
  belongs_to :user
  belongs_to :type
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
  has_many :ads_images, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :features
  accepts_nested_attributes_for :ads_images,:reject_if => lambda { |p| p['photo'].blank? },
    allow_destroy: true

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :body, presence: true, length: { minimum: 3,  maximum: 180 }
  validates :type, presence: true
  validates :user, presence: true
  validates :state, presence: true

  enumerize :state, in: [:sketch, :new, :approved, :rejected, :archived, :published], default: :sketch

  state_machine :state, initial: :sketch do
    before_transition :rejected => :sketch do |advertisment, transition|
      advertisment[:ban_reason] = nil
    end

    event :create do
      transition :sketch => :new
    end

    event :reject do
      transition :new => :rejected
    end

    event :approve do
      transition :new => :approved
    end

    event :recover do
      transition [:rejected,:archived] => :sketch
    end

    event :publish do
      transition :approved => :published
    end

    event :archive do
      transition :published => :archived
    end
  end

end
