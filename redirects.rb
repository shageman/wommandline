require 'sinatra'

set :haml, :format => :html5

def search_engine_map
  map = {
    am: { url: "http://www.amazon.com/s?ie=UTF8&keywords=QUERY", description: "Amazon" },
    g: { url: "https://www.google.com/search?personal=0&q=QUERY", description: "Depersonalized Google" },
    gim: { url: "http://www.google.de/search?personal=0&tbm=isch&q=QUERY", description: "Depersonalized Google image" },
    gm: { url: "http://maps.google.com/maps?q=QUERY", description: "Google Maps" },
    gr: { url: "https://www.google.com/search?personal=0&tbs=qdr:m&q=QUERY", description: "Depersonalized, recent Google" },
    leo: { url: "http://dict.leo.org/ende?search=QUERY", description: "Leo German-English Dictionary" },
    rg: { url: "http://rubygems.org/search?utf8=%E2%9C%93&query=QUERY", description: "Rubygems" },
    r: { url: "http://apidock.com/ruby/search?query=QUERY", description: "Ruby APIdock" },
    ra: { url: "http://railsapi.com/doc/rails-v3.0.8rc1_ruby-v1.9.2/", description: "Rails API - how to search?" },
    rr: { url: "http://api.rubyonrails.org/?q=QUERY", description: "Rails API" },
    scr: { url: "http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw=QUERY", description: "Scroogle" },
    wp: { url: "http://en.wikipedia.org/wiki/QUERY", description: "English Wikipedia" },
    wpg: { url:"http://de.wikipedia.org/wiki/QUERY" , description: "German Wikipedia" },
  }
  map.default = map[:scr]
  map
end

def search_engine_map_description
  search_engine_map.inject("") do |result, map|

  end
end

def parse_params(params)
  return nil if params.empty? || params['q'].empty?
  parameters = params['q'].split
  [parameters.length > 1 ? parameters.shift : "", CGI::escape(parameters.join(" "))]
end

get '/' do
  command, parameters = parse_params(params)
  unless command.nil?
    redirect to search_engine_map[command.to_sym][:url].gsub "QUERY", parameters
  else
    haml :index
  end
end
