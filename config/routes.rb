Vigor::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get "registrations/create"

  resources :vrhighlights

  resources :attachments

  resources :attatchments

  resources :restaurants

  resources :vegresources
  
  resources :home do
    collection do
      get 'send_email2list'
      get 'my_mailer'
      post 'send_email2list'
      post 'my_mailer'
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  
  devise_for :users, :controllers => { :registrations => "registrations" } do
    
   get "login", :to => "devise/sessions#new"
   delete "logout", :to => "devise/sessions#destroy"
   get "signup", :to => "devise/registrations#new"
   
  end
  
  resources :users do
   member do
     get 'removephoto'
     put 'addphoto'
     post 'addphoto'
   end
  end
  
  match "/users/:id/addphoto" => "users#addphoto", :via => [:post]
  match "/listrecipes/:by/:attr" => "recipes#list", :via => [:get]
  
  resources :events do
    collection do
      get 'calendar'
      post 'calendar'
      get 'copy'
      post 'list'
    end
    member do
      get 'review'
    end
  end

  resources :posts do
    collection do
      post 'comment'
      get 'comment'


    end
  end 
  resources :categories
  
  resources :recipes do
    with_scope_level(:list) do
      get 'list/:category', :to => "recipes#list"
    end
    
    member do
      get 'review'
    end
  end
  
  resources :lists

  resources :friends do
  collection do
   get 'list'
   post 'list'
  end
  end


  resources :list_cats
  resources :vrattributes
  
  resources :reviews, :except => [:new,:index] do   
    with_scope_level(:new) do
      get 'new/:toreview', :to => "reviews#new"
   end
    with_scope_level(:index) do
      get 'index/:reviewed', :to => "reviews#index"
   end
   
   member do
     get 'edit'
   end
 end
  
  resources :vegresources, :except => [:new] do   
    with_scope_level(:new) do
      get 'new/:vrtype', :to => "vegresources#new"
   end
    
    member do
      get 'review'
      get 'highlight'
    end
 end

  match '/books'  => 'vegresources#books'
  match '/videos' => 'vegresources#videos'
  match '/websites' => 'vegresources#websites'
  match '/csas' => 'vegresources#csas'
  match '/grocery' => 'vegresources#grocery'
  match '/ristorantes' => 'vegresources#restaurants'
    
  match '/contact' => 'home#contact'
  
end