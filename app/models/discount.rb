class Discount < ActiveRecord::Base

  belongs_to :company
  belongs_to :user
  has_many :restrictions

  validates :discount_percent,
              numericality: { only_integer: true},
              inclusion: { in: 1..100, message: "must be between 1 and 100"}

end