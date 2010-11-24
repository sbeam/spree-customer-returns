map.resources :orders do |order|
    order.resources :return_authorizations, :only => [:show, :new, :create]
end
