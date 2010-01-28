require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cafepress::Search::SearchResultSet do
  before(:all) do
    @result_xml = File.read(File.join(File.dirname(__FILE__), '..', 'data', 'dog_search.xml'))
  end
  
  before(:each) do
    @results = Cafepress::Search::SearchResultSet.parse(@result_xml)
  end

  it "should load the results" do
    @results.results.each { |result| result.is_a?(Cafepress::Search::SearchResult).should be_true }
  end

  it "the number of results loaded should match the given result set size" do
    @results.results.size.should == @results.size
  end

  it "should load the result set size" do
    @results.size.should == 60
  end
  
  it "should know the total number of designs for this query" do
    @results.total_designs.should == 519187
  end

  it "should know the total number of products for this query" do
    @results.total_products.should == 16153172
  end
  
  it "should load the starting result index" do
    @results.start_index.should == 0
  end

  it "should load the sort type" do
    @results.sort.should == 'by_score_desc'
  end

  it "should load the topics" do
    @results.topics.should == [
      'pets',
      'pet',
      'canine',
      'puppy',
      'gifts',
      'animals',
      'breeds',
      'art',
      'humor',
      'purebred'
    ]
  end
  
  it "should know the query used to generate the result set" do
    @results.query.should == "dog"
  end
end

