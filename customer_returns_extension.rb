# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CustomerReturnsExtension < Spree::Extension
  version "1.0"
  description "Allows the customer to initiate their own Returns/RMA from their order detail page"
  url "http://yourwebsite.com/customer_returns"


  def activate

    # there must be some reason!! (and at least one variant to be returned!!!) 
    ReturnAuthorization.class_eval do
      validates_presence_of :reason, :on => :create
      #validates_presence_of :variant # <--- this cant be done on create because the controller is weird.
    end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
