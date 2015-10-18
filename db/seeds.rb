
require 'faker'

200.times do User.create(:username => Faker::Name.name, :email => Faker::Internet.email, :password => Faker::Internet.password(8)) 

end

200.times do Company.create(:company_name => Faker::Company.name) 

end

200.times do Discount.create(:discount_percent => Faker::Number.between(10, 40), :user_id => Faker::Number.between(1, 50), :company_id => Faker::Number.between(1, 50)) 

end

200.times do Restriction.create(:discount_id => Faker::Number.between(1, 50), :description => Faker::Lorem.sentence) 

end

