# frozen_string_literal: true

class V1::ApiController < ApplicationController
  include JsonResponders
  include ExceptionHandler
  include MissingData
  include Consul::Controller

  before_action :authenticate_user!
  before_action :set_locale
  require_power_check

  # Authenticate the request by headers (used for all apis)
  def authenticate_user!
    return if missing_headers!('Authorization')

    @token ||= AuthenticateRequest.get(Admin, request.headers['Authorization'].split(' ').last)
    set_curret_user_with_access
  end

  def set_curret_user_with_access
    @current_user = @token[:user]
    @access       = @token[:access]
    return render_forbidden(error: 1201, message: I18n.t('errors.1305')) if @current_user.inactive?
  end
  # self.responder = ApplicationResponder

  private

  # Set Power and inject it with current user
  current_power do
    Power.new(current_user)
  end

  # Set request locale
  def set_locale
    I18n.locale = params[:locale] || request.headers['locale'] || I18n.default_locale
  end
end
