require 'happymapper'

module Cafepress
  module Search
    class SearchResult
      include HappyMapper
      tag 'searchResultItem'

      attribute :search_type, String, :tag => 'type'
      attribute :design_url, String, :tag => 'mediaUrl'
      attribute :design_detail_page_url, String, :tag => 'marketplaceUrl'
      attribute :design_id, Integer, :tag => 'mediaId'
    
      has_many :products, Product
    end
  end
end
