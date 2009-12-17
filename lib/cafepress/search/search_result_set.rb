
require 'happymapper'

module Cafepress
  module Search
    class SearchResultSet
      include HappyMapper
      tag 'searchResultSet'

      attribute :size, Integer, :tag => 'resultLength'
      attribute :total_designs, Integer, :tag => 'totalDesigns'
      attribute :total_products, Integer, :tag => 'totalProducts'
      attribute :start_index, Integer, :tag => 'startResult'
      attribute :sort, String

      element :subtopics, String
      element :searchQuery, String
    
      has_many :results, SearchResult
    
      def topics
        @topics ||= subtopics.split("\n").inject([]) do |groomed, topic|
          groomed << topic.strip unless topic.strip == ""
          groomed
        end
      end

      def query
        @query ||= searchQuery.strip
      end
    end
  end
end