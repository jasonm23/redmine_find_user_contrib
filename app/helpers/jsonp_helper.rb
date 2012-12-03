module JsonpHelper

  def json_or_jsonp json, request

    callback = (request.params[:callback] || request.params[:jsonp]).to_s.gsub(/[^a-zA-Z0-9_]/, '')
    
    if callback.present?
      json = "#{callback}(#{json})"
      response.content_type = 'application/javascript'
    end

    json

  end

end
