class ContributedController < ApplicationController
  unloadable
  
  def find

    id = params[:id]
    field_list = "id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private"

    @issues = Issue.find_by_sql("select #{field_list} from issues,journals where issues.author_id = #{id} or issues.assigned_to_id = #{id} or (issues.id = journals.journalized_id and journals.user_id = #{id})")

    respond_to do |format|
      format.json { send_data( @issues.to_json ) }
    end

  end

end
