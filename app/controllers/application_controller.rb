class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  after_action :allow_facebook_iframe

  private

    def allow_facebook_iframe
      response.headers['X-Frame-Options'] = 'ALLOW-FROM http://blogger.firmsone.com/'
    end
end