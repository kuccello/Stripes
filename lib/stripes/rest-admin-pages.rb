# shows a list of the pages for a site
get '/admin/site/:site_pid/pages' do
  login_required
end

# shows a list of the pages for a site
get '/admin/pages' do
  login_required

  pages = session[:user].all_pages
  dirs = []

  haml :'admin/pages', :layout=>:'admin/layout', :locals=>{:pages=>pages,:dirs=>dirs,:context_label=>"All Pages"}
end

get '/admin/site/:site_pid/page/new' do
  login_required
end

post '/admin/site/:site_pid/page/new' do
  login_required
end
