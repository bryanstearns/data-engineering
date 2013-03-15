class Item < ActiveRecord::Base
  has_many :purchases
  monetize :price_cents

  attr_accessible :name, :price
end
