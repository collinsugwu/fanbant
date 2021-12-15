Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get'surveys/answers', to: 'surveys#surveys_with_answers'
  get'surveys/:id/analytics', to: 'analytics#index'
  resources :surveys do
    resources :questions do
      resources :options
    end
  end

  # Answer a question
  get 'questions/:question_id/options/:option_id/answer', to: 'answers#answer'
end
