RailsAdmin.config do |config|

  config.authorize_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      username == Rails.application.secrets.user &&
      password == Rails.application.secrets.password
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
