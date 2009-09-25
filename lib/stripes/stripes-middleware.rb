class StripesMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    domain_name = env['SERVER_NAME']

    # is this domain name on the list?

    if valid_site(domain_name) then
      rack_input = env['rack.input'].read
      params = Rack::Utils.parse_query(rack_input, "&")
      env["rack.input"] = StringIO.new(Rack::Utils.build_query(params))

      pr = ProxyRequest.new
      pr.env = env
      pr. params = params

      content = "<html><body><h1>This site is not configured</h1></body></html>"

      # actually do the work for this request
      # content = do_work()

      [200, {"Content-Type" => "text/html"}, content]
    elsif admin_site(domain_name)

      status, headers, body = @app.call env
    else

      content = "<html><body><h1>This site is not configured</h1></body></html>"
      [200, {"Content-Type" => "text/html"}, content]
    end
  end

  def valid_site(domain_name)
    # ask the repo for the site with pid = domain name - if it exists then its valid
    App.transaction do
      App::Site[domain_name]
    end
  end

  def admin_site(domain_name)
    # check the global variable from installed.rb for a match  
    $domain_name_for_admin === domain_name
  end
end

class ProxyRequest
  attr_accessor :env, :params
end
