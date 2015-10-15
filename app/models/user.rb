class User < ActiveRecord::Base

  has_many :discounts
  has_secure_password

  validates :username,
              presence: true,
              uniqueness: true,
              length: {maximum: 25}

  validates :email,
              presence: true,
              uniqueness: true  

  validate :valid_email?  

 private

 def valid_email?
   errors.add(:email, "This isn't a valid email.") unless email =~ /\A[\w+\-.]{3,}@[a-z\d\-.]{3,}\.[a-z]{2,}\z/i
 end

end
