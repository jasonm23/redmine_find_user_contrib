class ContributedController < ApplicationController
  unloadable

  def find
    id = params[:id]

    # Issue(id: integer, tracker_id: integer, project_id: integer, subject: string, description: text, due_date: date, category_id: integer, status_id: integer, assigned_to_id: 
    # integer, priority_id: integer, fixed_version_id: integer, author_id: integer, lock_version: integer, created_on: datetime, updated_on: datetime, start_date: date, 
    # done_ratio: integer, estimated_hours: float, parent_id: integer, root_id: integer, lft: integer, rgt: integer, is_private: boolean

    @issues = Issue.find_by_sql("select * from issues,journals where issues.author_id = #{id} or issues.assigned_to_id = #{id} or (issues.id = journals.journalized_id and journals.user_id = #{id})")
    respond_to do |format|
      format.json { send_data( @issues.to_json ) }
    end
  end

end
