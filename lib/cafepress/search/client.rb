require 'net/http'
require 'uri'

module Cafepress
  module Search
    class Client
      attr_accessor :app_key

      def initialize(app_key)
        @app_key = app_key
      end

      def self.base_url
        @@base_url
      end

      def self.base_url=(url)
        @@base_url = url
      end

      def search(query)
        SearchResultSet.parse(Net::HTTP.get(query_url(query)))
      end

      private

      def query_url(query)
        URI.parse("#{Cafepress::Search::Client.base_url}/product.search.cp?appKey=#{URI.escape(app_key)}&query=#{URI.escape(query)}")
      end
    end
  end
end