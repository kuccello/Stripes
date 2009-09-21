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

  # TODO -- return a list of sites that the current user has access to
  sites = session[:user].site_list

  haml :'admin/sites', :layout=>:'admin/layout', :locals=>{:sites=>sites, :context_label=>"Sites"}
  
end

# delivers a form to create a new site
get '/admin/site/new' do
  login_required

  sites = session[:user].site_list

  # Present form
  haml :'admin/site-form', :layout=>:'admin/layout', :locals=>{:sites=>sites, :context_label=>"Sites &gt; New Site"}
end

# process submission of site form
post '/admin/site/new' do
  login_required

  #if submit = cancel then redirect to /admin
  redirect '/admin' if params[:submit] == "Cancel"

  begin
  # Process form
  site = App::Site.create_new_site(params,session[:user])

  # will need a special flash message here
  flash[:error] = "Could not create site: #{params[:domain]}!" unless site
  flash[:success] = "Site '#{params[:domain]}' created!" if site

  rescue => e
    flash[:error] = "Exception: #{e} -- Domain: #{params[:domain]}!"
  end

  redirect '/admin/sites'
end

get '/admin/site/:site_pid' do
  login_required
end

# shows a list of the pages for a site
get '/admin/site/:site_pid/pages' do
  login_required
end
