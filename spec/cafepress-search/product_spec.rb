require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cafepress::Search::Product do
  before(:all) do
    @result_xml = File.read(File.join(File.dirname(__FILE__), '..', 'data', 'dog_search.xml'))
  end

  before(:each) do
    @product = Cafepress::Search::Product.parse(@result_xml).first
  end

  it "should have a merchandise_id" do
    @product.merchandise_id.should == 4
  end

  it "should have a merchandise_name" do
    @product.merchandise_name.should == "Sweatshirt"
  end

  it "should have a price" do
    @product.price.should == "$32.99"
  end


  it "should have an id" do
    @product.id.should == 384814123
  end

  it "should have a thumbnail_url" do
    @product.thumbnail_url.should == 'http://www.cafepress.com/cp/search/image.aspx?p=384814123&i=34016862'
  end

  it "should have a detail_page_url" do
    @product.detail_page_url.should == 'http://www.cafepress.com/buy/dog/-/pv_design_prod/pg_1/p_4102863.384814123/pNo_384814123/id_34016862'
  end
end

