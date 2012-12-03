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
    
    json = json_or_jsonp "{\"message\": \"Not yet implemented\"}", request
    
    respond_to do |format|
      format.json  {render :json => json}
      format.js    {render :json => json}
    end
  end

end
