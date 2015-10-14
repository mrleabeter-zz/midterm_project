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
  @company = Company.new(
    company_name:   params[:company_name],
    url: params[:url]
  )
  @discount = Discount.new(
    discount_percent:  params[:discount_percent]
  )
  @restriction = Restriction.new(
    description:  params[:description]
  )
  if @user.save && @company.save && @discount.save && @restriction.save
    redirect '/user/signup_successful'
  else
    erb :index
  end
end