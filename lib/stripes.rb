require 'rubygems'
require 'sinatra'
require 'json'
require 'haml'
require 'sass'
require 'xampl'
require File.join(File.dirname(__FILE__), "stripes/model/app-init" )

use Rack::Session::Pool, :expire_after => 60 * 30 #60 * 60 * 24 * 365

$transaction_context = 'stars'
set :views, File.dirname(__FILE__) + '/stripes/views'
set :public, File.dirname(__FILE__) + '/stripes/public'

not_found do
  '404 - Could not find the requested resourse'
end

error do
  'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

require File.join(File.dirname(__FILE__), "stripes/stripes-rest-admin" )
require File.join(File.dirname(__FILE__), "stripes/stripes-rest" )
