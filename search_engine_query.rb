require 'cgi'

class SearchEngineQuery

  attr_reader :parameters, :command, :query, :url

  MAPPING = {
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

  def initialize(params = nil)
    @parameters = params['q'].strip if params.is_a?(Hash) && params['q']
  end

  def url
    @url ||= MAPPING[command][:url].gsub "QUERY", query if command
  end

  def command
    return @command if @command
    return nil if !@parameters || @parameters == ''
    potential_command = @parameters.split.first.to_sym
    @command = MAPPING[potential_command].nil? ? default_command : potential_command
  end

  def query
    return @query if @query
    return nil if !@parameters || @parameters == ''
    p = @parameters.dup.split
    p.shift if command && command != default_command || p.first.to_sym == default_command
    @query = CGI::escape(p.join(" "))
  end

  def default_command
    :scr
  end

end
