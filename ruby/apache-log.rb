require 'rubygems'
require 'apachelogregex'

format = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"'
  parser = ApacheLogRegex.new(format)

  File.readlines('aleurier_access.log').collect do |line|
  puts parser.parse(line)
    # {"%r"=>"GET /blog/index.xml HTTP/1.1", "%h"=>"87.18.183.252", ... }
end
