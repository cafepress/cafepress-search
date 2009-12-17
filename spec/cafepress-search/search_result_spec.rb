require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cafepress::Search::SearchResult do
  before(:all) do
    @result_xml = File.read(File.join(File.dirname(__FILE__), '..', 'data', 'dog_search.xml'))
  end

  before(:each) do
    @result = Cafepress::Search::SearchResult.parse(@result_xml).first
  end

  it "should have a search type" do
    @result.search_type.should == "IMAGE"
  end

  it "should have a design_url" do
    @result.design_url.should == 'http://images.cafepress.com/image/34016862_125x125.jpg'
  end

  it "should have a design_detail_page_url" do
    @result.design_detail_page_url.should == 'http://www.cafepress.com/buy/dog/-/pv_design_details/pg_1/id_34016862/hlv_1'
  end

  it "should have a design_id" do
    @result.design_id.should == 34016862
  end

  it "should have products" do
    @result.products.size.should == 3
    @result.products.each { |product|  product.is_a?(Cafepress::Search::Product).should == true }
  end
end

