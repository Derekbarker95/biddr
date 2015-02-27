class AddCurrentPriceToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :currentprice, :float
  end
end
