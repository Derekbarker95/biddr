class Auction < ActiveRecord::Base

  has_many :bids, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  
end
