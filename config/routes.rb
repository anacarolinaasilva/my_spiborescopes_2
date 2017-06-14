Rails.application.routes.draw do
  get 'account_activations/edit'

  root to: 'static_pages#home'
  resources :leads, :static_pages, :users, :origins, :messages
  resources :micropost, only:[:create, :destroy]
  resources :account_activations, only: [:edit]
  #resources :messages take care of this later!

  get '/contact-us' => 'static_pages#contact'

  get 'static_pages/about'
  get 'static_pages/products'
  get 'static_pages/demo'
  get 'static_pages/contact'
  get 'static_pages/faq'
  get 'static_pages/warranty'
  get 'static_pages/testimonials'

  get 'inspection-camera/faq'        => 'static_pages#faq'
  get 'inspection-camera/warranty' => 'static_pages#warranty'
  get 'inspection-camera/testimonials' => 'static_pages#testimonials'
  get 'inspection-camera/about'  => 'static_pages#about'
  get 'inspection-camera/products'  => 'static_pages#products'
  get 'inspection-camera/demo'  => 'static_pages#demo'
  get 'inspection-camera/contact'  => 'static_pages#contact'
  get 'inspection-camera/pricing'  => 'static_pages#pricing'
  get 'inspection-camera/nav-map'  => 'static_pages#nav_map'

  #Signup Routes
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  #GET    /login     route:login_path action:new
  #POST   /login     route:login_path action:create
  #DELETE /logout    route:logout_path action:destroy
  get 'dashboard' =>  'leads#dashboard'

  get 'static_pages/dg1Series'
  get 'static_pages/mc1Series'
  get 'static_pages/ultrathinSeries'
  get 'static_pages/x1Series'
  get 'static_pages/jcmSeries'
  get 'static_pages/faq'
  get 'static_pages/pricing'

  get 'inspection-camera/articulating/video-borescope/x1-series' => 'static_pages#x1Series'
  get 'inspection-camera/mechanical-articulating/video-borescope/mc1-series' => 'static_pages#mc1Series'
  get 'inspection-camera/pipe-inspection/digital-video-borescope/jcm-series' => 'static_pages#jcmSeries'
  get 'inspection-camera/articulating/video-borescope/dg1-series' => 'static_pages#dg1Series'
  get 'inspection-camera/micro-camera/video-borescope/ultrathin-series' => 'static_pages#ultrathinSeries'
  get 'inspection-camera' => 'static_pages#products'

  #This creates a route named new_message_url which maps GET requests
  #for http://localhost:3000/static_pages/contact to an action named MessagesController#new.
  #get 'inspection-camera/contact', to: 'messages#new', as: 'new_message'

  post 'contact-me', to: 'messages#create', as: 'create_message'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # photos_path returns /photos
  # new_photo_path returns /photos/new
  # edit_photo_path(:id) returns /photos/:id/edit (for instance, edit_photo_path(10) returns /photos/10/edit)
  # photo_path(:id) returns /photos/:id (for instance, photo_path(10) returns /photos/10)



end
