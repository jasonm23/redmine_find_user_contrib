class ContributedController < ApplicationController

  include ContributedHelper

  unloadable
  accept_api_auth :all
  before_filter :authorize
  
# POST /contributed
  def find
  
    @issues = []
    
    user_id = params[:user_id].to_i unless params[:user_id].blank?

    if User.exists?(user_id)

      select = <<-SQL 
          select #{issue_fields} from issues,journals
          where issues.author_id      = #{user_id} 
          or    issues.assigned_to_id = #{user_id} 
          or  ( issues.id             = journals.journalized_id 
                and 
                journals.user_id      = #{user_id} )
      SQL

      # Filter on Project id
      project_id = params[:project_id].to_i

      if Project.exists?(project_id)
        select.sub!(/where/, "where issues.project_id = #{project.id} and ")
      end

      @issues = Issue.find_by_sql(select)

    end

    render json: @issues.to_json 
    
  end

end
