class OrdersController < InheritedResources::Base
    before_filter :check_for_cancel, :only => [:create, :update]
    
    def check_for_cancel
        if params[:commit] == "Cancel Order"
            redirect_to lookbook_path
        end
    end
    
def new
    @cart = current_cart
    if @cart.line_items.empty?
        redirect_to lookbook_path
        return
    end
    @order = Order.new
    respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @order }
    end
end


def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    if current_user
        @order.user_id = current_user.id
        
    end
    @order.total = current_cart.total_price
    respond_to do |format|
    if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        session[:order_id] = @order.id
        OrderMailer.order_confirmation(@order, current_cart).deliver
        if current_user
            format.html { redirect_to lookbook_path }
        else
            format.html { redirect_to user_create_path}
        end
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end
    end
  end


end
