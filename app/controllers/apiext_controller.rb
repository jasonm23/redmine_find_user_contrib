class ApiextController < ApplicationController

  # include ApiExtHelper
  unloadable
  accept_api_auth :apikey, :memberlist

  def apikey_js
    json = "{\"apikey\": #{User.current.api_key}}"
    js = "callback(){ return #{json}; }"
    respond_to do |format|
      format.js   { render :js => js }
    end
  end

  def apikey_json
    json = "{\"apikey\": #{User.current.api_key}}"
    respond_to do |format|
      format.json { render :json => json }
    end
  end

  def memberlist
    respond_to do |format|
      format.api
    end    
  end

end
