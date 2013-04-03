FbShanghai::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  root :to => 'videos#index'
  resources :videos do
    get 'upload_to_azure', on: :member, as: 'azure'
  end
end
