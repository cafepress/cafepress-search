require 'happymapper'

module Cafepress
  module Search
    class Product
      include HappyMapper
      tag 'product'

      attribute :merchandise_id, Integer, :tag => 'productTypeNumber'
      attribute :merchandise_name, String, :tag => 'item'
      attribute :price, String
      attribute :id, Integer, :tag => 'productNumber'
      attribute :thumbnail_url, String, :tag => 'thumbnailUrl'
      attribute :detail_page_url, String, :tag => 'marketplaceUrl'
    end
  end
end
