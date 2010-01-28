require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cafepress::Search::Product do
  before(:all) do
    @result_xml = File.read(File.join(File.dirname(__FILE__), '..', 'data', 'dog_search.xml'))
  end

  before(:each) do
    @product = Cafepress::Search::Product.parse(@result_xml).first
  end

  it "should have a product id" do
    @product.id.should == 61897566
  end

  it "should have a merchandise_id" do
    @product.merchandise_id.should == 137
  end

  it "should have a merchandise_name" do
    @product.merchandise_name.should == "Rectangle Magnet"
  end

  it "should have a price" do
    @product.price.should == "$5.49"
  end

  it "should have a marketplace price" do
    @product.marketplace_price.should == "5.00"
  end

  it "should have a caption" do
    @product.caption.should == "Kiss Dog Lips Rectangle Magnet"
  end

  it "should have a seller description" do
    @product.seller_description.should == "I kiss my dog on the lips."
  end

  it "should have a thumbnail_url" do
    @product.thumbnail_url.should == 'http://www.cafepress.com/cp/search/image.aspx?p=61897566&i=13012560'
  end

  it "should have a detail_page_url" do
    @product.detail_page_url.should == 'http://www.cafepress.com/buy/dog/-/pv_design_prod/pg_1/p_593567.61897566/pNo_61897566/id_13012560'
  end

  it "should have a store_name" do
    @product.store_name.should == 'Dog Hause Pet Shop Promoting Spay Neuter &amp; Rescue'
  end

  it "should have a store_url" do
    @product.store_url.should == 'http://www.cafepress.com/doghause'
  end

  it "should have a parent_section_name" do
    @product.parent_section_name.should == 'Kiss Dog Lips'
  end

  it "should have a parent_section_url" do
    @product.parent_section_url.should == 'http://www.cafepress.com/doghause/949957'
  end
end

