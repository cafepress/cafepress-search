$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'cafepress/search/product'
require 'cafepress/search/search_result'
require 'cafepress/search/search_result_set'
require 'cafepress/search/client'

module Cafepress
  module Search
    VERSION = '1.0.0'

    Client.base_url = "http://api.cafepress.com"
  end
end