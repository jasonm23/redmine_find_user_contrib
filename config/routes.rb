ActionController::Routing::Routes.draw do |map|
  # /contributed.json?api_key=[key]&user_id=2&project_id=2
  map.contributed_find 'contributed.:format', :controller => 'contributed', :action => 'find'
end
