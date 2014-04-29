class ContactsController < InheritedResources::Base


 def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end



def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        ContactMailer.contact_message(@contact).deliver
        format.html { redirect_to lookbook_path}
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


end
