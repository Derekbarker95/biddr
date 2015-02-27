require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe "Validations" do

    def bid_attributes(new_attributes)
        valid_attributes = {ammount: 12}
        valid_attributes.merge(new_attributes)
    end

    it "Bid Greater than current price" do
      bid = Bid.new(bid_attributes({ammount: nil}))
      expect(bid).to be_invalid
    end

  end

end
