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
    OrdersHelper.module_eval do
      def link_to_tracking tnum, method, options={}
        if method.name.match /^UPS\b/ 
          link_to tnum, 'http://wwwapps.ups.com/WebTracking/processInputRequest?TypeOfInquiryNumber=T&InquiryNumber1='+tnum, options
        elsif method.name.match /^USPS\b/ 
          link_to tnum, 'http://trkcnfrm1.smi.usps.com/PTSInternetWeb/InterLabelInquiry.do?origTrackNum='+tnum, options
        else
          tnum
        end
      end
    end
  end
end
