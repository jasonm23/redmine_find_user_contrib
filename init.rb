require 'redmine'

Redmine::Plugin.register :redmine_find_user_contrib do
  name 'Redmine Find User Contributed plugin'
  author 'Jason Milkins'
  description 'Find issues, which a user contributed to (project id filter optional) - responds in .json'
  version '0.1.0'
  url 'https://github.com/jasonm23/redmine_find_user_contrib'
  author_url 'https://github.com/jasonm23/'
  permission :find_contributed, :contributed => :find
end
