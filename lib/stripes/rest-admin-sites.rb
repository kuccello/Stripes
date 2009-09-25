# shows a list of sites that the user has access to
get '/admin/sites' do
  login_required

  # TODO -- return a list of sites that the current user has access to
  sites = session[:user].site_list

  sites.each do |site|
    puts "#{__FILE__}:#{__LINE__} #{__method__} #{site.pp_xml}"
  end

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
    site = App::Site.create_new_site( params, session[:user] )

    # will need a special flash message here
    flash[:error] = "Could not create site: #{params[:domain]}!" unless site
    flash[:success] = "Site '#{params[:domain]}' created!" if site

  rescue => e
    flash[:error] = "Exception: #{e} -- Domain: #{params[:domain]}!"
  end

  redirect '/admin/sites'
end

post '/admin/site/:site_pid/file_op/:op' do
  login_required

  dir = params[:dir] || ''
  root = File.expand_path(".")
  site_dir = root + "/sites/#{site.pid}"

  orig_dir = Dir.pwd

  op = params[:op]
  path_to_op = params[:path_to_op]
  case op
    when 'mkdir'

    when 'rm'  
  end
end

post '/admin/site/:site_pid/file_struct' do
  login_required

  site = nil
  files = "<ul class=\"jqueryFileTree\" style=\"display: none;\">"

  App.transaction do

    site = App::Site[params[:site_pid]]

    dir = params[:dir] || ''

    root = File.expand_path(".")

    site_dir = root + "/sites/#{site.pid}"
    unless File.exists?(site_dir) && File.directory?(site_dir) then
      Dir.mkdir(site_dir)
    end

    path = root + "/sites/#{site.pid}/" + dir

    # chdir() to user requested dir (root + "/" + dir)
    orig_dir = Dir.pwd
    begin
      Dir.chdir(File.expand_path(path).untaint);

      # check that our base path still begins with root path
      if Dir.pwd[0, root.length] == root then

        #loop through all directories
        Dir.glob("*") do |x|
          if not File.directory?(x.untaint) then
            next
          end
          files << "<li class=\"directory collapsed\"><a href=\"#\" rel=\"#{dir}#{x}/\">#{x}</a></li>";
        end

        #loop through all files
        Dir.glob("*") do |x|
          if not File.file?(x.untaint) then
            next
          end
          ext = File.extname(x)[1..-1]
          files << "<li class=\"file ext_#{ext}\"><a href=\"#\" rel=\"#{dir}#{x}\">#{x}</a></li>"
        end
      else
        #only happens when someone tries to go outside your root directory...
        files << "You are way out of your league"
      end
    rescue => e
      files << "Not a directory or path that can be found! #{e}"
    end
    Dir.chdir(orig_dir)
  end

  files << "</ul>"

  files
end

get '/admin/site/:site_pid' do
  login_required

  site = nil

  App.transaction do

    site = App::Site[params[:site_pid]]

  end

  puts "#{__FILE__}:#{__LINE__} #{__method__} SITE #{params[:site_pid]} NOT FOUND: #{site}" unless site

#  res = haml :'admin/site', :layout=>:'admin/layout', :locals=>{:context_label=>"Site - NOT FOUND"} unless site
  haml :'admin/site', :layout=>:'admin/layout', :locals=>{:context_label=>"Site - #{site.name}", :site=>site}
end

