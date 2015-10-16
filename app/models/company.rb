class Company < ActiveRecord::Base

  has_many :discounts

  validates :company_name,
              presence: true

  scope :with_discounts, -> { includes(discounts: :user)
    .where.not(users: { id: nil})
    .where.not(discounts: { id: nil }) }            

end
