class Restriction < ActiveRecord::Base

  belongs_to :discount

  validates :discount, presence: true

end
