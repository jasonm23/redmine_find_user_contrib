require 'redmine'

Redmine::Plugin.register :redmine_find_user_contrib do
  name 'Redmine Find User Contributed plugin'
  author 'Jason Milkins'
  description "Find issues belonging to a project, which a user has contributed to - responds in .json - usage: http://redmine_url/contributed.json?user_id={id}&project_id={id}&key={redmine api key}"
  version '0.2.0'
  url 'https://github.com/jasonm23/redmine_find_user_contrib'
  author_url 'https://github.com/jasonm23/'
  permission :find_contributed, :contributed => :find
end