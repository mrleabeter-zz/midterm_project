# Homepage (Root path)
require 'pry'
get '/' do
  erb :index
end

get '/user/signup_successful'do
  erb :'user/signup_successful'
end

post '/' do
  # @errors = []
  # @errors << "not same password brooo" unless confirm_password
  @user = User.new(
    username:   params[:username],
    email: params[:email],
    password:  params[:password],
    password_confirmation: params[:password_confirmation]
  )
  @user.save

  existing_company = Company.find_by(company_name: params[:company_name])
  if existing_company != nil
    @company = existing_company
  else
    @company = Company.new(
      company_name:   params[:company_name]
    )
    @company.save
  end
  @company.save

  @discount = Discount.new(
    company_id: @company.id,
    discount_percent:  params[:discount_percent],
    user_id: @user.id
  )
  @discount.save

  @restriction = Restriction.new(
    discount_id: @discount.id,
    description:  params[:description]
  )
  @restriction.save

  if @user.save && @company.save && @discount.save && @restriction.save
    redirect '/user/signup_successful'
  else
    erb :index
  end
end

# def confirm_password
#   # binding.pry
#   unless params[:password] == params[:password_confirmation]
#     redirect '/'
#   end
# end