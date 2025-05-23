require 'ostruct'

class HomeController < ApplicationController
  # No need to skip authentication as it's not required globally anymore
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    @services = [
      OpenStruct.new(
        icon: "fas fa-code",
        title: "Product Development",
        description: "Custom software solutions built from scratch with end-to-end development lifecycle management."
      ),
      OpenStruct.new(
        icon: "fas fa-tools",
        title: "Maintenance & Support",
        description: "Comprehensive maintenance services to keep your software running smoothly and efficiently."
      ),
      OpenStruct.new(
        icon: "fas fa-search",
        title: "SEO Services",
        description: "Boost your online visibility with our expert SEO optimization services."
      )
    ]
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    
    if @contact.save
      # Send notification email here
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("contact_form", partial: "shared/contact_success") }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("contact_form", partial: "shared/contact_form", locals: { contact: @contact }) }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end 