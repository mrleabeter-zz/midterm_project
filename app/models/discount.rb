class Discount < ActiveRecord::Base

  belongs_to :company
  belongs_to :user
  has_many :restrictions

  validates :discount_percent,
              numericality: { only_integer: true},
              inclusion: { in: 1..100, message: "must be between 1 and 100"}
  scope :with_user, -> { includes(:user)
    .where.not( users:{id: nil}) }

end