class Item
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def discount
    @discount ||= Database.discount_for(name)
  end
end
