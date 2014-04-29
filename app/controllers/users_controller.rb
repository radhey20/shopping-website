class UsersController < ApplicationController
def new
  @user = User.new
end
  
  
def create
  @user = User.new (params[:user])
  if @user.save
      ConfirmationMailer.registration_confirmation(@user).deliver
    redirect_to users_path
  else
    render "new"
  end
end

def index
    @users = User.all
end

def show
    @products = Product.all
end

def History
    if current_user
        @orders = Order.where(:user_id => current_user.id)
        @line_items = LineItem.where("order_id IN (?)", @orders).select("order_id, product_id").to_a
        @l = @line_items.map { |l| l.product_id }
        @products = Product.where("id IN (?)", @l).uniq.to_a
       
    end
end

def CreateFromOrder
    @orders = Order.all
    orderId = session[:order_id]
    session[:order_id] = nil
    @order = Order.find (orderId)
    @user = User.new (params[:user])
    @user.email = @order.email
    @user.user_name = @order.name
    @user.user_address = @order.address
    @user.user_country = @order.country
    @user.user_zip = @order.zip
    @user.user_province = @order.state
    @user.user_city = @order.city
    if @user.save
        ConfirmationMailer.order_confirmation(@user).deliver
        redirect_to users_path
    else
        render "CreateFromOrder"
    end
end



end


