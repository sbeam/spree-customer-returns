class ReturnAuthorizationsController < Spree::BaseController
  resource_controller
  prepend_before_filter :reject_unknown_object,  :only => [:show, :edit, :update]
  ssl_required

  belongs_to :order

  new_action.before :returnable_units
  edit.before :returnable_units
  show.before :returnable_units
  create.before :returnable_units 

  create.flash I18n.t('your_return_has_been_created') 
  create.wants.html { redirect_to smart_url(parent_url_options) }

  create.after :associate_inventory_units




  private

  
  def returnable_units
    @returnable_units = @return_authorization.order.returnable_units
    @returned_units =  @return_authorization.inventory_units.group_by(&:variant_id)
  end



  # TODO this is copied from Admin::ReturnAuthorizationsController and it is un-DRY to have it here.
  def associate_inventory_units
    params[:return_quantity].each { |variant_id, qty| @return_authorization.add_variant(variant_id.to_i, qty.to_i) }
  end

end

