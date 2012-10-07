require 'redmine'

Redmine::Plugin.register :redmine_find_user_contrib do
  name 'Redmine Find User Contributed plugin'
  author 'Jason Milkins'
  description "Find issues belonging to a project, which a user has contributed to - responds in .json - usage: http://redmine_url/contributed.[json||js]?user_id={id}&project_id={id}&key={redmine api key}[&jsonp={callback name}] - for example http://myredmine.com/contributed.json?user_id=1&project_id=1&key=secretcode gets all the issues for project 1 that user 1 has authored, is assigned to, or has contributed to, in json format. http://myredmine.com/contributed.js?user_id=1&project_id=1&key=secretcode&jsonp=contribCallback Returns the same data but as a .js function wrapping the json data (jsonp)"
  version '0.1.4'
  url 'https://github.com/jasonm23/redmine_find_user_contrib'
  author_url 'https://github.com/jasonm23/'
  permission :find_contributed, :contributed => :find
end
