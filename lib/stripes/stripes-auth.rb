get '/login' do

end

post '/login' do

end

get '/logout' do

end

get '/forgot' do

end

post '/forgot' do

end

module Helpers
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
