# Homepage (Root path)
get '/' do
  if session[:user_id]
    redirect '/user/profile'
  else
    erb :index
  end
end

get '/user/login' do
  erb :'user/login'
end

get '/user/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/user/update_profile' do
  erb :'user/update_profile'
end

get '/user/profile' do
  @discounts = Discount.all
  @user = User.find(session[:user_id])
  @companies = Company.all
  erb :'user/profile'
end

get '/companies' do
  @companies = Company.with_discounts
  erb :'companies/index'
end  

get '/companies/:company_id/discount' do
  @company = Company.find(params[:company_id])
  erb :'companies/discount'
end

get '/user/:id' do
  erb :'user/profile'
end

get '/stores' do
  @companies = Company.all
  erb :'stores/index'
end

post '/' do
  @user = User.new(
    username:   params[:username].downcase,
    email: params[:email],
    password:  params[:password],
    password_confirmation: params[:password_confirmation]
  )
  @user.save
  session[:user_id] = @user.id

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

  restriction_description = params[:description]
  if  restriction_description != ""
    @restriction = Restriction.new(
      discount_id: @discount.id,
      description:  params[:description]
    )
    @restriction.save
  end

  if @user.save && @company.save && @discount.save
    redirect '/'
  else
    erb :index
  end
end

post '/user/login' do
  user = User.find_by(
    username: params[:username].downcase,
  )
  if user.authenticate(params[:password])
    response.set_cookie 'user_session', {
      value: params[:user_id],
      max_age: 60000
    }
    session[:user_id] = user.id
    redirect '/user/profile'
  else
    erb :'user/login'
  end
end

post '/user/update_profile' do
  @user = User.find(session[:user_id])
  @user.update(
    username:   params[:username].downcase,
    email: params[:email],
    password:  params[:password],
    password_confirmation: params[:password_confirmation]
  )
  @user.save
  if @user.save
    redirect '/user/profile'
  else
    erb :index
  end
end

get '/user/:discount_id/restriction' do
  @discount = Discount.find(params[:discount_id])
  erb :'user/restriction'
end

post '/user/:discount_id/restriction' do
  @discount = Discount.find(params[:discount_id])
  restriction_description = params[:description]
  if restriction_description != ""
    @restriction = Restriction.new(
      discount_id: @discount.id,
      description: params[:description]
      )
    @restriction.save
    redirect '/user/profile'
  else
    redirect "/user/#{@discount.id}/restriction"
  end
end

get '/user/:user_id/discount' do
  @user = User.find(params[:user_id])
  erb :'user/discount'
end

post '/user/:user_id/discount' do
  @user = User.find(session[:user_id])

  @existing_company = Company.find_by(company_name: params[:company_name])
  if @existing_company
    return erb :'user/discount'
  else
    @company = Company.new(
      company_name:   params[:company_name]
    )
    @company.save
  end

  @discount = Discount.new(
    user_id: @user.id,
    company_id: @company.id,
    discount_percent: params[:discount_percent]
    )

  if @company.save
    @discount.save
    @restriction = Restriction.new(
      discount_id: @discount.id,
      description: params[:description]
      )
    @restriction.save
    redirect '/user/profile'
  else
  redirect "/user/#{@user.id}/discount"
  end
end
