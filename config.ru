require "rack/jekyll"
require "yaml"
require "rack-rewrite" # optional

# (optional) Redirect www.example.com to example.com
use Rack::Rewrite do
  r301 %r{.*}, 'http://bibhas.in$&', :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != 'bibhas.in' }
end

# Use rack/jekyll to run the site on Heroku
run Rack::Jekyll.new