require './main'
use Rack::Static, :urls => ["/css","/img"], :root => "public"
run Rack::URLMap.new \
  "/"  => FakeDict.new
