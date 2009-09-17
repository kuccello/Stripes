require 'rubygems'
require 'sinatra'
require 'json'
require 'haml'
require 'sass'
require 'xampl'
require File.join(File.dirname(__FILE__), "stripes/model/app-init" )
require 'rack-flash'

$STRIPES_VERSION = "0.1"

use Rack::Session::Pool, :expire_after => 60 * 30 #60 * 60 * 24 * 365
use Rack::Flash

$transaction_context = 'stars'
set :views, File.dirname(__FILE__) + '/stripes/views'
set :public, File.dirname(__FILE__) + '/stripes/public'

not_found do
  '404 - Could not find the requested resource'
end

error do
  'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

def is_installed() 
  is_installed = File.exist?(File.dirname(__FILE__)+"/stripes/installed.rb")
  puts "IS IT INSTALLED: #{is_installed}"
  if is_installed then
    require File.join(File.dirname(__FILE__), "stripes/installed" )
  end
end

# this is to support the setup process like in wordpress
require File.join(File.dirname(__FILE__), "stripes/stripes-setup" ) unless is_installed()

before do
  puts "#{__FILE__}:#{__LINE__} #{__method__} #{$STRIPES_INSTALLED} << stripes installed flag?"
  if $STRIPES_INSTALLED then
    puts "#{__FILE__}:#{__LINE__} #{__method__} STRIPES IS INSTALLED! SKIPPING FILTER"
  else
    redirect '/onetimesetup' if $stripes_configuration_setup_flag && !request.env["REQUEST_PATH"].include?('/onetimesetup')
  end
end

require File.join(File.dirname(__FILE__), "stripes/stripes-auth" )
require File.join(File.dirname(__FILE__), "stripes/stripes-rest-admin" )
require File.join(File.dirname(__FILE__), "stripes/stripes-rest" )
