require 'spec_helper'

describe Deck do
  
  context "saving a deck" do
    
    before { @d = Deck.new }
    
    it "does not save without setting #deck_data" do
      @d.save.should be_false
    end
  
    it "does not save without a step" do
      @d.deck_data = []
      @d.save.should be_false
    end
  
    it "contains an array in #deck_data" do
      @d.deck_data = Step.new
      @d.save.should be_false
    end
  end
  
  describe "#html" do
    
    before do 
      @d = Deck.new 
      @d.deck_data = [Step.new]
      @d.deck_data[0].content = "Hello World"
      @d.save
    end
    
    # it "has the content in the <div> for each step" do
    #       @d_html = @d.html
    #       @d_html.should have_selector(:div, text: "Hello World")
    #     end
    
    it "has the boilerplate markup"
    
  end
  
end
