require 'happymapper'

module Cafepress
  module Search
    class Product
      include HappyMapper
      tag 'product'

      attribute :id, Integer, :tag => 'productNumber'
      attribute :merchandise_id, Integer, :tag => 'productTypeNumber'
      attribute :merchandise_name, String, :tag => 'item'
      attribute :price, String
      attribute :marketplace_price, String, :tag => 'marketplacePrice'
      attribute :caption, String
      attribute :seller_description, String, :tag => 'sellerDescription'
      attribute :thumbnail_url, String, :tag => 'thumbnailUrl'
      attribute :detail_page_url, String, :tag => 'marketplaceUrl'
      attribute :store_name, String, :tag => 'storeName'
      attribute :store_url, String, :tag => 'storeUrl'
      attribute :parent_section_name, String, :tag => 'parentSectionName'
      attribute :parent_section_url, String, :tag => 'parentSectionUrl'
    end
  end
end
