ActionController::Routing::Routes.draw do |map|
  map.contributed_find 'contributed', :controller => 'contributed', :action => 'find', :method => 'post'
end
