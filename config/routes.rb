Rails.application.routes.draw do
  # Devise for token authentication
  mount_devise_token_auth_for 'User', at: 'auth'

  # Root of application
  root :to => "home#index"
  get '/home' => 'home#index'

  # API endpoints
  scope '/api' do
    # Version 1 of API
    scope module: :v1, constraints: ApiConstraint.new(version: 1) do
      scope '/v1' do
        # Posts resources
        resources :posts, only: [:index, :create, :show, :update, :destroy]
      end
    end
  end
end
