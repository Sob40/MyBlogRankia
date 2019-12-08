Rails.application.routes.draw do
  get 'articles/index'

  # Añadimos los articulos para definir sus rutas. Aqui indicamos que Comments depende de los articulos. >> rails routes (ver rutas en consola)
  resources :articles do
    resources :comments
  end
 
  # Añadimo el root para indicar que el la pagina que será la de inicio.
  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
