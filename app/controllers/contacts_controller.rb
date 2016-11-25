class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      render :new
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
