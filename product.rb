class Product
  attr_accessor :name, :price

  def initialize(name, price)
    self.name = name
    self.price = price
  end

  def name=(value)
    unless value.is_a?(String)
      raise TypeError, 'Product name must be a string'
    end
    @name = value
  end

  def price=(value)
    unless value.is_a?(Float)
      raise TypeError, 'Product price must be a float'
    end
    @price = value
  end

end
