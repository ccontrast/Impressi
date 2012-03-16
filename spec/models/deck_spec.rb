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
  
  "user managing decks"
  "home page with option of templates"
  
end
