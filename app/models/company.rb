class Company < ActiveRecord::Base

  has_many :discounts

  validates :company_name,
              presence: true

end
