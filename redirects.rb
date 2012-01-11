require 'sinatra'
require File.join(File.expand_path(__FILE__), '/../search_engine_query')

set :haml, :format => :html5

get '/' do
  search_engine_query = SearchEngineQuery.new(params)
  search_engine_query.url ? redirect(to(search_engine_query.url)) : haml(:index)
end
