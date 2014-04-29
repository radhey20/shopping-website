class OrderMailer < ActionMailer::Base
  default from: "railscs372@gmail.com"    
    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.confirmation_mailer.order_confirmation.subject
    #
    def order_confirmation (order, current_cart)
        @products = Product.all
        @line_items = LineItem.find(:all, :conditions => { :order_id => order.id })
        @order = order
        mail to: @order.email, subject: "QLine Order Confirmation"
    end
end
