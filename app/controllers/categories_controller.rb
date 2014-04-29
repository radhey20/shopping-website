
class CategoriesController < InheritedResources::Base
  def index
        @categories = Category.all
  end
    
  def show
        @category = Category.find(params[:category_id])
        @products = Product.all
  end
end
 