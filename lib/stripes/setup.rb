puts "================================================================"
puts " Stripes Configuration Setup:"
puts "================================================================"

$stripes_configuration_setup_flag = true

get '/onetimesetup' do
  haml :'onetimesetup/first-step', :layout=>:'onetimesetup/layout'
end

post '/onetimesetup/admin' do
  # params - email, pass
  session[:setup] = {:admin=>{:email=>params[:email], :pass=>params[:pass]}}
  redirect '/onetimesetup/finish'  
end

get '/onetimesetup/finish' do
  # here we will create the installed.rb file
  local_filename = File.dirname(__FILE__)+"/installed.rb"
  stamp = Time.now
  doc = <<-INSTALLED
# REMOVE THIS FILE TO HAVE SETUP RUN AGAIN
puts "=============================================="
puts " Stripes v#{$STRIPES_VERSION} has been setup - #{stamp.strftime("%b. %d, %Y")}"
puts "=============================================="
$STRIPES_INSTALLED = true
$transaction_context = "stars-#{stamp.strftime('%Y-%m-%d-%H-%M-%S')}"
# PUTS SETTINGS IN PLACE FOR THIS INSTANCE OF THE APPLICATION
  INSTALLED
  File.open(local_filename, 'w') {|f| f.write(doc) }

  require File.dirname(__FILE__)+"/installed"

  email,password = session[:setup][:admin][:email], session[:setup][:admin][:pass]
  App.create_default_administrator(email,password)

  haml :'onetimesetup/finish', :layout=>:'onetimesetup/layout'
end

=begin
Format meaning:

  %a - The abbreviated weekday name (``Sun'')
  %A - The  full  weekday  name (``Sunday'')
  %b - The abbreviated month name (``Jan'')
  %B - The  full  month  name (``January'')
  %c - The preferred local date and time representation
  %d - Day of the month (01..31)
  %H - Hour of the day, 24-hour clock (00..23)
  %I - Hour of the day, 12-hour clock (01..12)
  %j - Day of the year (001..366)
  %m - Month of the year (01..12)
  %M - Minute of the hour (00..59)
  %p - Meridian indicator (``AM''  or  ``PM'')
  %S - Second of the minute (00..60)
  %U - Week  number  of the current year,
          starting with the first Sunday as the first
          day of the first week (00..53)
  %W - Week  number  of the current year,
          starting with the first Monday as the first
          day of the first week (00..53)
  %w - Day of the week (Sunday is 0, 0..6)
  %x - Preferred representation for the date alone, no time
  %X - Preferred representation for the time alone, no date
  %y - Year without a century (00..99)
  %Y - Year with century
  %Z - Time zone name
  %% - Literal ``%'' character

   t = Time.now
   t.strftime("Printed on %m/%d/%Y")   #=> "Printed on 04/09/2003"
   t.strftime("at %I:%M%p")            #=> "at 08:56AM"
=end
