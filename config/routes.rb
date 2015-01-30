Rails.application.routes.draw do
  root 'pages#home'

  post 'contact', to: 'pages#contact'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
