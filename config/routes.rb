map.resources :orders do |order|
    order.resources :return_authorizations, :member => {:fire => :put}
end
