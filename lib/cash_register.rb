require 'pry'
class CashRegister
  attr_accessor :total, :discount, :item, :last_transaction, :last_items_array
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items_array = []
  end
  
  def add_item(title, price, quantity = 1)
    array_quantity = quantity
    while array_quantity != 0 do
      @items_array << title
      array_quantity-=1
    end
    
    # slice array from back depending on quantity
    # Have to clone the array because slice modifies original.
    @last_items_added = @items_array.clone
    # binding.pry
    # pp @last_items_added
    # puts @items_array
    # binding.pry
    # pp @last_items_added
    # keep track of total
    # total_items = (title + " ") * quantity
    # @items_array = total_items.split(" ") 
    self.total += (price * quantity)
    @last_transaction = price * quantity
    # slice! returns items left over
    @last_items_added.slice!(-quantity, quantity)
  end

  def apply_discount
    if @discount != 0
    @total = @total.to_f - @total.to_f * @discount.to_f / 100.00 
    "After the discount, the total comes to $#{@total.to_i}."
    else
    "There is no discount to apply."
    end
  end

  def items
    # puts @items_array
    @items_array
  end

  def void_last_transaction
    # puts "Original array"
  # pp self.items
  @items_array = @last_items_added
  # puts "After last_items"
  # pp self.items
    @total -= @last_transaction
  end
  
end
