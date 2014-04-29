class LineItemsController < ApplicationController
  

 
 def create
     @cart = current_cart
     product = Product.find(params[:product_id])
     @line_item = @cart.line_items.build(product: product)
     @line_item.cart_id = @cart.id
     respond_to do |format|
         if @line_item.save
             format.html { redirect_to @line_item.cart }
             format.json { render json: @line_item, status: :created, location: @line_item }
        else
            format.html { render action: "new" }
            format.json { render json: @line_item.errors, status: :unprocessable_entity }
         end
     end
 end

def destroy
    if LineItem.exists?(params[:id])
    @cart = current_cart
    @line_item = LineItem.find(params[:id])
    @line_item.delete
    end
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { head :no_content }
    end
  end
end
  