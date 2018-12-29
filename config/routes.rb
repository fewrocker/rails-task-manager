Rails.application.routes.draw do
  get "tasks", to: "tasks#index", as: "tasks"

  get "tasks/new", to: "tasks#new", as: "new_task"
  post "tasks", to: "tasks#create"

  get "tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  patch "tasks/:id", to: "tasks#update"

  delete "tasks/:id", to: "tasks#destroy"

  get "tasks/:id", to: "tasks#show", as: "task"

  get "tasks/:id/markdoneshow", to: "tasks#mark_as_done_show", as: "mark_done_show"
  get "tasks/:id/marknotdoneshow", to: "tasks#mark_not_done_show", as: "mark_not_done_show"

  get "tasks/:id/markdoneindex", to: "tasks#mark_as_done_index", as: "mark_done_index"
  get "tasks/:id/marknotdoneindex", to: "tasks#mark_not_done_index", as: "mark_not_done_index"

  root to: 'tasks#index'
end
