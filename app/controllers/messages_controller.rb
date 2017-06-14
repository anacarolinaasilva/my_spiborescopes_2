class MessagesController < ApplicationController

def new
  #set @message variable to be a new instance of the Message model
  @message = Message.new
end


def create
  @message = Message.new message_params
  #If the Message is valid then we redirect to new_message_url
  if @message.valid?
    #Call the Mailer if the message received from the user is valid.
    MessageMailer.contact_me(@message).deliver_now
    #redirect_to new_message_url, notice: "Message received, thanks!"
    redirect_to new_message_path, notice: "Message received, thanks!"

  else
    render :new
  end
end

private
    def message_params
        #Sanitize the contents of the submitted form into a local variable called message_params
        #and use it to construct a Message object named @messag
        message_params = params.require(:message).permit(:name, :email, :phone, :company, :body)
    end

end
