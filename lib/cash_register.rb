require 'pry'
#ARGUMENTS 
class CashRegister
  attr_accessor :total, :last_trans, :discount, :items
  #setting optional argument
  #options = {}
  #set default in parentheses 
  def initialize(discount = 0)
    @total = 0
    @last_trans = 0
    @discount = discount
    @items = []
  
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    self.last_trans = price * quantity
    quantity.times do
      self.items << title
    end
  end

  def apply_discount
    if self.discount == 0 
      return "There is no discount to apply."
    else
      original_price = self.total 
      percent = self.discount
      self.total = ((100-percent)*0.01)*original_price 
      return "After the discount, the total comes to $#{@total.to_i}." 
    end
  end
  
  def void_last_transaction 
    self.total -= self.last_trans
  end 
end

