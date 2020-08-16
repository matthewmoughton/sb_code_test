class Database
  def self.discount_for(item)
    discounts.fetch(item, nil)
  end

  def self.discounts
    {
      apple: '2_for_1',
      orange: nil,
      pear: '2_for_1',
      banana: 'half_price',
      pineapple: '1_half_price',
      mango: 'buy_3_1_free'
    }
  end
end
