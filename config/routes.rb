Rails.application.routes.draw do

  namespace :admin do
    root to: "homes#top"
  end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
