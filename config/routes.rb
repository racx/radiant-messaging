ActionController::Routing::Routes.draw do |map|
  # map.namespace :admin, :member => { :remove => :get } do |admin|
  #   admin.resources :messaging
  # end
  map.resources :messages, :only => [ :index, :create ], :controller => 'messages'
end
