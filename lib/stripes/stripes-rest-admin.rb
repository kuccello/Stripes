get '/admin' do
  login_required
  #redirect "/users" unless current_user.admin? || current_user == params[:id]
  haml :'admin/lobby',:layout=>:'admin/layout',:locals=>{:context_label=>"Lobby"}
  #haml :'admin/index',:layout=>false
end

get '/admin/users/:id/edit' do
  login_required
  #redirect "/users" unless current_user.admin? || current_user == params[:id]
end

post '/admin/users/:id/edit' do
  login_required
  #redirect "/users" unless current_user.admin? || current_user == params[:id]
end

get '/admin/users/:id/delete' do
  login_required
  #redirect "/users" unless current_user.admin? || current_user == params[:id]
end


# shows a list of sites that the user has access to
get '/admin/sites' do
  login_required
end

# delivers a form to create a new site
get '/admin/site/new' do
  login_required
end

# process submission of site form
post '/admin/site/new' do
  login_required
end

get '/admin/site/:site_pid' do
  login_required
end

# shows a list of the pages for a site
get '/admin/site/:site_pid/pages' do
  login_required
end
