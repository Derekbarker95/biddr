class BidsController < ApplicationController

  before_action :find_auction, only: [:new, :create]

  def new
    @bid = Bid.new
    @bid.auction = @auction
  end

  def create
    @bid = Bid.new bid_params
    @bid.auction = @auction
    if @bid < @auction.currentprice
      @bid.save
      redirect_to @auction
    else
      render :new
    end
  end

  private

  def find_auction
    @auction = Auction.find params[:auction_id]
  end

  def bid_params
    params.require(:bid).permit(:ammount)
  end
end
