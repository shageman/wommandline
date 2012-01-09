require 'sinatra'

def parse_params(params)
  parameters = params.keys.first.split
  [parameters.shift, parameters.join(" ")]
end

get '/' do
  command, parameters = parse_params(params)
  new_url = case command
            when 'g'
              "https://www.google.com/search?q=#{parameters}"
            when 'gr'
              "https://www.google.com/search?tbs=qdr:m&q=#{parameters}"
            when 'gim'
              "http://www.google.de/search?tbm=isch&q=#{parameters}"
            when 'amz'
              "http://www.amazon.com/s?ie=UTF8&keywords=#{parameters}"
            when 'wp'
              "http://en.wikipedia.org/wiki/#{parameters}"
            when 'wpg'
              "http://de.wikipedia.org/wiki/#{parameters}"
            when 'gm'
              "http://maps.google.com/maps?q=#{parameters}"
            when 'rg'
              "http://rubygems.org/search?utf8=%E2%9C%93&query=#{parameters}"
            when 'scr'
              "http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw=#{parameters}"
            end
  redirect to new_url
end
