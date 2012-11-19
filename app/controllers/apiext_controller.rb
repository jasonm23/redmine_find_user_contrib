class ApiextController < ApplicationController

  # include ApiExtHelper
  unloadable
  accept_api_auth :apikey

  def apikey

    json = User.current.api_key

    respond_to do |format|
      format.json { render :json => json }
      format.js   { render :json => json }
    end

  end


end
