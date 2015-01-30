class PagesController < ApplicationController

  def home

  end

  def contact
    contact = params[:contact]
    ContactMailer.contact_email(contact).deliver_later
    render json: true, status: :ok
  end
end
