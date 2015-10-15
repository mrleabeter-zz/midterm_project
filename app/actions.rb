# Homepage (Root path)
get '/' do
  erb :index
end

get '/user/signup_successful'do
  erb :'user/signup_successful'
end

post '/' do
  @user = User.new(
    username:   params[:username],
    email: params[:email],
    password:  params[:password]
  )
  existing_company = Company.find_by(company_name:  params[:company_name])
  if existing_company != nil
    @company = existing_company
  else
    @company = Company.new(
      company_name:   params[:company_name],
      url: params[:url]
    )
  end
  @discount = Discount.new(
    company_id: @company.id,
    discount_percent:  params[:discount_percent],
    user_id: @user.id
  )
  @restriction = Restriction.new(
    discount_id: @discount.id,
    description:  params[:description]
  )
  if @user.save && @company.save && @discount.save && @restriction.save
    redirect '/user/signup_successful'
  else
    erb :index
  end
end