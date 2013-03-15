class Datafile
  attr_reader :error, :total_gross_revenue

  def initialize(rows)
    @rows = rows
    @total_gross_revenue = 0.to_money
  end

  def save
    @rows.each do |row|
      purchase = RowSaver.new(row).save!
      @total_gross_revenue += purchase.gross_revenue
    end
    @error = nil
    true
  rescue StandardError => e
    @error = e.message
    false
  end

  class RowSaver
    def initialize(row)
      @row = row
    end

    def save!
      Purchase.create!(merchant: merchant,
                       item: item,
                       purchaser: purchaser,
                       count: @row.purchase_count)
    end

    def merchant
      # (assumes that merchants at different addresses with the same name
      #  are distinct merchants: did you buy it at the Walgreens on 10th,
      #  or the one on 21st?)
      Merchant.where(name: @row.merchant_name,
                     address: @row.merchant_address)\
              .first_or_initialize
    end

    def item
      # (in keeping with the above, I'm modeling the same item at a
      #  different price as a distinct item.)
      Item.where(description: @row.item_description,
                 price_cents: @row.item_price.to_money.cents)\
          .first_or_initialize
    end

    def purchaser
      Purchaser.where(name: @row.purchaser_name)\
               .first_or_initialize
    end
  end
end
