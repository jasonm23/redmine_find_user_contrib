class ContributedController < ApplicationController

  include ContributedHelper

  unloadable
  before_filter :find_project
  before_filter :authorize
  accept_api_auth :find

  # POST /contributed
  def find

    @issues = nil

    user_id = params[:user_id].to_i unless params[:user_id].blank?

    if User.exists?(user_id)

      issues       = Issue.arel_table
      time_entries = TimeEntry.arel_table
      journals     = Journal.arel_table

      @issues = Issue.
        includes(
                 [:journals, 
                  :time_entries]).
        where(
              issues[:assigned_to_id].
              eq(user_id).
              or(issues[:author_id].
                 eq(user_id)).
              or(journals[:user_id].
                 eq(user_id)).
              or(time_entries[:user_id].
                 eq(user_id))
              )
      # Filter on Project id
      project_id = params[:project_id].to_i

      if Project.exists?(project_id)
        @issues = Issue.
          includes(
                   [:journals, 
                    :time_entries]).
          where(
                issues[:project_id].eq(project_id).
                and(issues[:assigned_to_id].
                    eq(user_id)).
                or(issues[:author_id].
                   eq(user_id)).
                or(journals[:user_id].
                   eq(user_id)).
                or(time_entries[:user_id].
                   eq(user_id))
                )
      end
      
    end

    json = @issues.to_json(:include => [:time_entries, :journals])

    # JSON / JSON-P
    callback = (request.params[:callback] || request.params[:jsonp]).to_s.gsub(/[^a-zA-Z0-9_]/, '')
    
    if callback.present?
      json = "#{callback}(#{json})"
      response.content_type = 'application/javascript'
    end
    
    respond_to do |format|
      format.json  {render :json => json}
      format.js    {render :json => json}
    end

  end

  private

  def find_project
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
  end

end
