class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			flash[:success]= "new contact successfully added!"
			redirect_to contacts_path
		else
			render 'new'
		end
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		 if @contact = Contact.update(contact_params)
				redirect_to contacts_path
	 	 else
				render 'edit'
		 end 
	end

	def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end
	private
	def contact_params
		params.require(:contact).permit(:name, :company, :email, :phone)
	end
end
