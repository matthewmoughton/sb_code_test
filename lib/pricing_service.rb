class PricingService
  attr_reader :discount, :price, :count
  private :discount, :price, :count

  def initialize(discount: nil, price:, count:)
    @discount = discount
    @price = price
    @count = count
  end

  def calculate
    if discount.nil?
      standard_price
    else
      apply_discount
    end
  end

  private

  def standard_price
    price * count
  end

  def apply_discount
    discounts.fetch(discount)
  end

  def discounts
    {
      '2_for_1' => two_for_one,
      'half_price' => half_price,
      '1_half_price' => one_half_price,
      'buy_3_1_free' => buy_three_one_free
    }
  end

  def two_for_one
    if count % 2 == 0
      price * (count / 2)
    else
      standard_price
    end
  end

  def half_price
    ((price.to_f / 2) * count).to_i
  end

  def one_half_price
    price / 2.to_f + (price * (count - 1))
  end

  def buy_three_one_free
    if count == 4
      price * 3
    else
      standard_price
    end
  end
end
