class Bid < ActiveRecord::Base
  belongs_to :auction

  validates :ammount, presence: true
end
