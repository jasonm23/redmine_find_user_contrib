class ContributedController < ApplicationController
  unloadable
  
  def find

    id = params[:id]
    field_list = "issues.id, issues.tracker_id, issues.project_id, issues.subject, issues.description, issues.due_date, issues.category_id, issues.status_id, issues.assigned_to_id, issues.priority_id, issues.fixed_version_id, issues.author_id, issues.lock_version, issues.created_on, issues.updated_on, issues.start_date, issues.done_ratio, issues.estimated_hours, issues.parent_id, issues.root_id, issues.lft, issues.rgt, issues.is_private"

    @issues = Issue.find_by_sql("select #{field_list} from issues,journals where issues.author_id = #{id} or issues.assigned_to_id = #{id} or (issues.id = journals.journalized_id and journals.user_id = #{id})")

    respond_to do |format|
      format.json { send_data( @issues.to_json ) }
    end

  end

end
