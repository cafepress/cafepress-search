
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

      element :raw_subtopics, String, :tag => 'subtopics'
      element :search_query, String, :tag => 'searchQuery'
    
      has_many :results, SearchResult
          
      def subtopics
        @topics ||= raw_subtopics.split("\n").inject([]) do |groomed, topic|
          groomed << topic.strip unless topic.strip == ""
          groomed
        end
      end
      
      def topics
        subtopics
      end

      def query
        @query ||= search_query.strip
      end
    end
  end
end