class MessagesController < ApplicationController
	
	def index
		@messages = Recipient.where(:user_id => current_user.id).order('created_at DESC')
	end

	def new
		@message = Message.new
		@recipients = Contact.all
	end

	def create
      @message = current_user.messages.build(message_params)

      if @message.save
      	flash[:success]= "Message sent!"
      	redirect_to contacts_path 
      else
      	flash[:alert]= "sorry!message unsent"
      	render :new
      end
	end

private
def message_params
	params.require(:message).permit(:body, :sender_id, user_tokens:[]) 
	end
end
