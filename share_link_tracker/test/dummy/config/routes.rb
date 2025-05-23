Rails.application.routes.draw do
  mount ShareLinkTracker::Engine => "/share_link_tracker"
end
