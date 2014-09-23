class Advertisment < ActiveRecord::Base
  extend Enumerize
  belongs_to :user
  belongs_to :type
  has_many :ads_images, dependent: :destroy
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
