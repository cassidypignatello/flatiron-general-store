class ShoppingCart < ActiveRecord::Base
  belongs_to :buyer, class_name: "User"
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items 

  def add_product(product_id)
    #binding.pry
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
      current_item.save
    else
      current_item = line_items.build(product_id: product_id)
      current_item.save
    end
    current_item
  end

  def cart_calculator
    total = 0
    self.line_items.each do |line|
     line_total = line.product.price * line.quantity
     total += line_total
    end
    total
  end

  def cart_calculator_cents
    self.cart_calculator * 100.to_i
  end

  def cart_count
    @line_item_total = 0 
    self.line_items.each do |line|
      line.quantity
      @line_item_total += line.quantity
    end
    @line_item_total
  end


end


