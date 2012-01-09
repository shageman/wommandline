require 'rubygems'

require File.join(File.dirname(__FILE__), '/redirects')
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class RedirectsTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hi
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World!', last_response.body
  end
end
