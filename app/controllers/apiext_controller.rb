class ApiextController < ApplicationController

  include JsonpHelper
  
  unloadable
  accept_api_auth :apikey, :memberlist

  def apikey

    json = json_or_jsonp "{\"apikey\": #{User.current.api_key}}", request
    
    respond_to do |format|
      format.json  {render :json => json}
      format.js    {render :json => json}
    end

  end

  def memberlist
    @project_id = params[:project_id]
    @role_id = params[:role_id]
    members = Member.arel_table
    member_roles = MemberRole.arel_table
    @members = Member.includes(:member_roles).
      where(
            members[:project_id].eq(@project_id).
            and(member_roles[:role_id]. eq(@role_id)))
  end

end
