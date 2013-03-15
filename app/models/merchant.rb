class Merchant < ActiveRecord::Base
  has_many :purchases

  attr_accessible :address, :name
end
