Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get'surveys/answers', to: 'surveys#surveys_with_answers'
  
  resources :surveys do
    resources :questions do
      resources :options
    end
  end

  # select an answer
  get 'questions/:question_id/options/:option_id/answer', to: 'answers#answer'
end