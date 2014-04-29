class Order < ActiveRecord::Base
has_many :line_items, dependent: :destroy
  attr_accessible :email, :address, :name, :card_number, :cvc, :expiry_Date, :country, :city, :zip, :state, :total
PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

validates :email, :address, :name, :card_number, :cvc, :expiry_Date, :country, :city, :zip, :state, presence: true

 validates :card_number, :cvc, numericality: { only_integer: true }

def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
    end
end


end
