Rails.application.routes.draw do
  mount Tracker::Engine => "/tracker"
end
