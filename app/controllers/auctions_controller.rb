class AuctionsController < ApplicationController

  before_action :find_auction, only: [:show, :edit, :update, :destroy]

  def new
    @auction = Auction.new
  end 

  def create 
    @auction = Auction.new auction_params
    if @auction.save
      redirect_to @auction
    else
      render :new
    end
  end


  def show

  end

  def index
  @auction = Auction.order(:id)
 end

 def edit

 end

 def update 

    if @auction.update auction_params
      redirect_to @auction
    else
      render :edit
    end
 end

 def destroy 
    @auction.destroy
    redirect_to auctions_path
 end 

  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :description, 
                                      :reserve, :end_date,
                                      :currentprice)
  end
end
