require 'rails_helper'

RSpec.describe Auction, type: :model do

  describe "Validations" do

    def auction_attributes(new_attributes)
        valid_attributes = {title: "valid title",
                            description: "valid desc",
                            reserve: 2000,
                            end_date: (Time.now + 10.days),
                            currentprice: 10}
        valid_attributes.merge(new_attributes)
    end

      it "requires a title" do
      auction = Auction.new(auction_attributes({title: nil}))
      expect(auction).to be_invalid
    end

    it "requires a description" do
      auction = Auction.new(auction_attributes({description: nil}))
      expect(auction).to be_invalid
    end

    it "requires the title to be unique" do
      Auction.create(auction_attributes({title: "abc"}))
      auction = Auction.new(auction_attributes({title: "abc"}))
      expect(auction).to be_invalid
    end

  end

  
end
