Rails.application.routes.draw do
  resources :papers do
    resources :paper_files
  end
  resources :paper_files do
    resources :papers
  end
end
