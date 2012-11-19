if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    get '/contributed.json', :to => "contributed#find"
    get '/contributed.js', :to => "contributed#find"
    get '/apiext/apikey.json', :to => "apiext#apikey"
    get '/apiext/apikey.js', :to => "apiext#apikey"
  end
else
  ActionController::Routing::Routes.draw do |map|
    # /contributed.json?api_key=[key]&user_id=2&project_id=2
    map.contributed_find '/contributed.json', :controller => 'contributed', :action => 'find'
    map.contributed_find '/contributed.js', :controller => 'contributed', :action => 'find'
    map.apiext_apikey '/apiext/apikey.json', :controller => 'apiext', :action => 'apikey'
    map.apiext_apikey '/apiext/apikey.js', :controller => 'apiext', :action => 'apikey'
  end
end
