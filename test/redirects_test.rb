require 'rubygems'

require File.join(File.expand_path(__FILE__), '/../../redirects')
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class String

  def should_redirect_to(url)
  end
end

class RedirectsTest < Test::Unit::TestCase
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def test_redirect_if_querying_for_search_engine
    get '/?q=g+TEST'
    follow_redirect!

    assert_equal "https://www.google.com/search?personal=0&q=TEST", last_request.url
  end

  def test_show_index_if_nothing_is_queried
    get '/'

    assert last_response.ok?
    assert last_response.body.include? "Pass it on"
  end

end
