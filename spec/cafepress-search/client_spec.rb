require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'uri'

describe Cafepress::Search::Client do
  before(:all) do
    @result_xml = File.read(File.join(File.dirname(__FILE__), '..', 'data', 'dog_search.xml'))
    Cafepress::Search::Client.base_url = "http://example.com"
  end

  before(:each) do
    @client = Cafepress::Search::Client.new('application key')
  end

  describe "#serch" do
    context "when the http interaction succeeds" do
      it "should request the appropriate search url" do
        query_url = 'http://example.com/product.search.cp?appKey=application%20key&query=dog'
        Net::HTTP.should_receive(:get).once.with(URI.parse(query_url)).and_return(@result_xml)
        @client.search('dog')
      end

      it "should return a search result set object" do
        Net::HTTP.stub!(:get).and_return(@result_xml)
        @client.search('dog').is_a?(Cafepress::Search::SearchResultSet).should be_true
      end
    end

    context "when the http interaction fails" do
      it "should raise an error" do
        Net::HTTP.stub!(:get).and_raise(Net::HTTPError)
        Proc.new { @client.search('beans') }.should raise_error
      end
    end
  end
end