# frozen_string_literal: true

class V1::SessionsController < V1::BaseController
  power :sessions
  skip_before_action :authenticate_user!

  def create
    return if missing_params!(:username, :password)

    @admin = Admin.login(login_params.to_h.symbolize_keys)

    return render_bad_request(error: 1308) if @admin == false
    # return render_bad_request(error: @admin) if @admin.errors.any?
    # return render_bad_request(error: 1305) if @admin.inactive?

    data = { data: { admin: @admin.as_api_response(show_template), token: generate_token(@admin) } }
    render_success(data: data, message: 'تم تسجيل الدخول بنجاح')
  end

  private

  def login_params
    params.permit(:username, :password)
  end

  def generate_token(user)
    JsonWebToken.encode(user.payload, 720.hours.from_now)
  end
end
