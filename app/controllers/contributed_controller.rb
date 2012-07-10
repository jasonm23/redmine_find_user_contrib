class ContributedController < ApplicationController

  unloadable
  accept_api_auth :all
  
# POST /contributed
  def find

    user_id = params[:user_id].to_i

    if User.exists?(user_id)

      select <<-SQL 
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

      render :json @issues.to_json and return

    end

    render :nothing, :status => 404 # Not found

  end

end
