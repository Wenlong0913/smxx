Rails.application.routes.draw do
  get 'product/list'
  get 'product/show'
  get 'product/cart'
  get 'product/order'
  get 'product/pay'
  get 'product/add_address'
  get 'product/address_list'
  get 'product/share'
  get 'product/qrcode'

  get 'agent/homepage'
  get 'agent/products'
  get 'agent/events'

  get 'agent/comments'

  get 'agent/qrcode'

  get 'unuser/invite_register'
  get 'unuser/no_invite_register'
  get 'unuser/no_invite_register_down'

  get 'home/index'

  get 'home/about'
  get 'home/select'

  get 'home/contact'

  root "home#select"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
