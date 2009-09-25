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


require File.join(File.dirname(__FILE__), "rest-admin-sites" )
require File.join(File.dirname(__FILE__), "rest-admin-pages" )
