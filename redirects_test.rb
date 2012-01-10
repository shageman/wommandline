require 'rubygems'

require File.join(File.dirname(__FILE__), '/redirects')
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class String
  include Rack::Test::Methods
  include Test::Unit::Assertions
  def app
    Sinatra::Application
  end


  def should_redirect_to(url)
    get self.to_s
    follow_redirect!

    assert_equal url, last_request.url
  end
end

class RedirectsTest < Test::Unit::TestCase


  def test_redirect_to_google
    '/?q=g+TEST'.should_redirect_to "https://www.google.com/search?personal=0&q=TEST"
  end

  def test_redirect_to_google_recent_pages
    '/?q=gr+TEST'.should_redirect_to "https://www.google.com/search?personal=0&tbs=qdr%3Am&q=TEST"
  end

  def test_redirect_to_google_image_search
    '/?q=gim+TEST'.should_redirect_to "http://www.google.de/search?personal=0&tbm=isch&q=TEST"
  end

  def test_redirect_to_amazon
    '/?q=am+TEST'.should_redirect_to "http://www.amazon.com/s?ie=UTF8&keywords=TEST"
  end

  def test_redirect_to_english_wikipedia
    '/?q=wp+TEST'.should_redirect_to "http://en.wikipedia.org/wiki/TEST"
  end

  def test_redirect_to_german_wikipedia
    '/?q=wpg+TEST'.should_redirect_to "http://de.wikipedia.org/wiki/TEST"
  end

  def test_redirect_to_google_maps
    '/?q=gm+TEST'.should_redirect_to "http://maps.google.com/maps?q=TEST"
  end

  def test_redirect_to_rubygems
    '/?q=rg+TEST'.should_redirect_to "http://rubygems.org/search?utf8=%E2%9C%93&query=TEST"
  end

  def test_redirect_to_scroogle
    '/?q=scr+TEST'.should_redirect_to "http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw=TEST"
  end

end
