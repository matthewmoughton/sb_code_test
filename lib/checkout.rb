class Checkout
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    total = 0

    items_and_counts.each do |item, count|
      checkout_item = Item.new(item)
      item_price = prices.fetch(item)
      discount = checkout_item.discount

      total += PricingService.new(
        discount: discount,
        price: item_price,
        count: count
      ).calculate
    end

    total
  end

  private

  def items_and_counts
    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }
  end

  def basket
    @basket ||= Array.new
  end
end
