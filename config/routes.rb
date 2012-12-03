if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    get '/contributed.json', :to => "contributed#find"
    get '/contributed.js', :to => "contributed#find"
    get '/apiext/apikey.json', :to => "apiext#apikey_json"
    get '/apiext/apikey.js', :to => "apiext#apikey_js"
    get '/apiext/members.json', :to => "apiext#memberlist_json"
    get '/apiext/members.js', :to => "apiext#memberlist_js"
  end
else
  ActionController::Routing::Routes.draw do |map|
    # /contributed.json?api_key=[key]&user_id=2&project_id=2
    map.contributed_find '/contributed.json', :controller => 'contributed', :action => 'find'
    map.contributed_find '/contributed.js', :controller => 'contributed', :action => 'find'
    map.apiext_apikey '/apiext/apikey.json', :controller => 'apiext', :action => 'apikey_json'
    map.apiext_apikey '/apiext/apikey.js', :controller => 'apiext', :action => 'apikey_js'
    map.memberslist_members '/apiext/members.json', :controller => 'apiext', :action => 'memberlist_json'
    map.memberslist_members '/apiext/members.js', :controller => 'apiext', :action => 'memberlist_js'
  end
end
