class Restriction < ActiveRecord::Base

  belongs_to :discount

  validates :description,
              presence: true,
              length: { in: 5..50 }

end