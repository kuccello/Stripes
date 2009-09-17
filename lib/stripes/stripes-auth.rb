
# deliver the login page
get '/login' do
  haml :"common/login-form", :layout=>:'admin/layout'
end

# process the login attempt
post '/login' do
  # params : email & password
  member = App::Member.authenticate(params[:email],params[:pass])
  if member then
    # obviously this guy exists and gave the right info
    session[:user] = member
    redirect '/admin'
  else
    # TODO -- log this somewhere
    # FLASH MESSAGE -- BAD LOGIN
    flash[:error] = "Bad login attempt."
    redirect '/login'
  end
end

# process logout
get '/logout' do

end

# deliver the forgot password form
get '/forgot' do

end

# handle the forgot password form
post '/forgot' do

end

puts "==== Building Helpers 1 ==="
helpers do
  def login_required
    if session[:user]
      return true
    else
      session[:return_to] = request.fullpath
      redirect '/login'
      return false
    end
  end

  def current_user
    if session[:user]
      User.first(:id => session[:user])
    else
      GuestUser.new
    end
  end

  def logged_in?
    !!session[:user]
  end

  def use_layout?
    !request.xhr?
  end
end
puts "==== Built Helpers 1 [done.] ==="
