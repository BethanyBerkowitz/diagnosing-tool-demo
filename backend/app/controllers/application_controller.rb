class ApplicationController < ActionController::Base
    # I don't want to deal with CSRF for now
    skip_before_action :verify_authenticity_token
end
