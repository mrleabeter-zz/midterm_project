class Company < ActiveRecord::Base

  has_many :discounts

  validates :company_name,
              presence: true

  validate :valid_company_url

private

  def valid_company_url
    errors.add(:url_not_valid, "must be in format http(s)://www.website.com") unless url =~ /^(https|http)?:\/\/[\S]+/
  end

end
