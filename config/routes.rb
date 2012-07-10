ActionController::Routing::Routes.draw do |map|
  map.contributed_find 'contributed/:id', :controller => 'contributed', :action => 'find'
end
