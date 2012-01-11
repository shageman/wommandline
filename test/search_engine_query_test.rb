require 'rubygems'

require File.join(File.expand_path(__FILE__), '/../../search_engine_query')
require 'test/unit'

class SearchEngineQueryTest < Test::Unit::TestCase
  def test_parameters_is_possible_if_it_was_a_hash_with_key_q
    assert_equal "something", SearchEngineQuery.new('q' => "something").parameters
  end

  def test_parameters_is_nil_if_not_a_hash
    assert_equal nil, SearchEngineQuery.new("something").parameters
  end

  def test_parameters_is_nil_if_hash_has_no_key_q
    assert_equal nil, SearchEngineQuery.new("a" => "something").parameters
  end


  def test_command_nil_if_parameters_nil
    assert_equal nil, SearchEngineQuery.new.command
  end

  def test_command_is_default_if_unknown
    assert_equal SearchEngineQuery.new.default_command, SearchEngineQuery.new('q' => 'something_unknown QUERY').command
  end

  def test_command_is_first_word_in_params_if_known
    assert_equal :g, SearchEngineQuery.new('q' => 'g QUERY').command
  end


  def test_default_command
    assert_equal :scr, SearchEngineQuery.new(nil).default_command
  end


  def test_query_is_all_words_minus_first_if_first_is_know_search_engine
    assert_equal "term1+term2", SearchEngineQuery.new('q' => 'g term1 term2').query
  end

  def test_query_is_all_words_minus_first_if_first_is_default_search_engine
    assert_equal "term1+term2", SearchEngineQuery.new('q' => "#{SearchEngineQuery.new.default_command} term1 term2").query
  end

  def test_query_is_all_words_if_first_is_unknown_search_engine
    assert_equal "something_unknown+term1+term2", SearchEngineQuery.new('q' => 'something_unknown term1 term2').query
  end

  def test_query_is_empty_string_there_is_only_search_engine_command
    assert_equal "", SearchEngineQuery.new('q' => "#{SearchEngineQuery.new.default_command}").query
  end


  def test_query_is_nil_if_parameters_nil
    assert_equal nil, SearchEngineQuery.new.query
  end

  def test_query_is_cgi_escaped
    assert_equal "term%3Dsomething", SearchEngineQuery.new('q' => 'term=something').query
  end

  def test_url_is_search_engine_url_with_correct_query_params
    assert_equal "https://www.google.com/search?personal=0&q=TEST", SearchEngineQuery.new('q' => 'g TEST').url
  end

  def test_url_is_nil_if_no_command
    assert_equal nil, SearchEngineQuery.new.url
  end
end
