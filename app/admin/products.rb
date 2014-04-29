ActiveAdmin.register Product do
 
    form :html => { :enctype => "multipart/form-data" } do |f|
 
      f.inputs "Product", :multipart => true do
 
        f.input :title

	 f.input :price
        f.input :avaliable_on
	 f.input :category
 	 f.input :description
        f.input :size
        f.input :colour
        f.input :quantity
         f.input :photo
	
	
 
      end
 
 
      f.buttons
 
    end
 
  end
