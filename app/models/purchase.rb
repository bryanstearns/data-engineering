class Purchase < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :item
  belongs_to :purchaser

  attr_accessible :count, :item, :merchant, :purchaser

  def gross_revenue
    item.price * count
  end
end
