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

      def search(query, options = {})
        SearchResultSet.parse(Net::HTTP.get(query_url(options.merge('query' => query))))
      end

      private

      def query_url(options = {})
        URI.parse("#{Cafepress::Search::Client.base_url}/product.search.cp?#{format_options(options)}")
      end

      def format_options(options)
        options.merge('appKey' => app_key).collect do |key,value|
          "#{camelize(key)}=#{URI.escape(value)}"
        end.join('&')
      end

      # taken from rails/activesupport/lib/active_support/inflector.rb, line 178
      # Didn't want to require activesupport for one function
      def camelize(lower_case_and_underscored_word)
        camelized = lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
        camelized[0,1].downcase + camelized[1..-1]
      end
    end
  end
end