# Homepage (Root path)
require 'pry'
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
  @user.save
<<<<<<< HEAD

  existing_company = Company.find_by(company_name: params[:company_name])
=======
  existing_company = Company.find_by(company_name:  params[:company_name])
>>>>>>> bb47eaf8bb8db6d5bcb66a5a40c9a0019c3af6e6
  if existing_company != nil
    @company = existing_company
  else
    @company = Company.new(
      company_name:   params[:company_name],
      url: params[:url]
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
<<<<<<< HEAD

=======
>>>>>>> bb47eaf8bb8db6d5bcb66a5a40c9a0019c3af6e6
  @restriction = Restriction.new(
    discount_id: @discount.id,
    description:  params[:description]
  )
  @restriction.save
<<<<<<< HEAD

  if @user.save && @company.save && @discount.save && @restriction.save
    redirect '/user/signup_successful'
  else
    erb :index
  end
end
=======
  # if @user.save && @company.save && @discount.save && @restriction.save
  #   redirect '/user/signup_successful'
  # else
    erb :index
  # end
end
>>>>>>> bb47eaf8bb8db6d5bcb66a5a40c9a0019c3af6e6
