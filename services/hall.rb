class Service::Hall < Service

  default_events :commit_comment, :gollum, :issues, :issue_comment, :pull_request, :push
  string :room_token

  # Supportors and Maintainers
  maintained_by :github => 'bhellman1'
  supported_by :web => 'https://hallcom.uservoice.com/', :email => 'contact@hall-inc.com', :twitter => 'hall'

  def receive_push
    raise_config_error "Missing room token" if data['room_token'].to_s.empty?
    room_token = data['room_token'].to_s

    res = http_post "https://hall.com/api/1/services/github/#{room_token}", :payload => JSON.generate(payload)
  end

end