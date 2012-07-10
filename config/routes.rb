ActionController::Routing::Routes.draw do |map|
  map.contributed_find 'contributed/:id.json', :controller => 'contributed', :action => 'find'
end
