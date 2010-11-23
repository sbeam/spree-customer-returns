class ReturnAuthorizationsController < Spree::BaseController
  resource_controller
  prepend_before_filter :reject_unknown_object,  :only => [:show, :edit, :update]
  ssl_required

  belongs_to :order

  new_action.before :returnable_units
  edit.before :returnable_units

  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }
  destroy.success.wants.js { render_js_for_destroy }

  update.after :associate_inventory_units
  create.after :associate_inventory_units




  private

  def returnable_units
    @returnable_units = @return_authorization.order.returnable_units
    @returned_units =  @return_authorization.inventory_units.group_by(&:variant_id)
  end



  def associate_inventory_units
    params[:return_quantity].each { |variant_id, qty| @return_authorization.add_variant(variant_id.to_i, qty.to_i) }
  end

end

