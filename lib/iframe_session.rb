class ActionController::Base
  before_action :set_p3p

  def self.iframe_session_fix(redirect_path, options = {})
    require 'user_agent'

    class_attribute :redirect_path
    before_action :cookie_fix, options

    self.redirect_path = redirect_path.present? ? redirect_path : '/'
  end

  private

  def set_p3p
    response.headers['P3P'] = 'CP="NOI DSP LAW NID"'
  end

  def cookie_fix
    user_agent = UserAgent.parse(request.user_agent)

    if %w(MSIE Safari).include?(user_agent.browser)
      return if session[:cookie_fixed]
      if params[:cookie_fix].present?
        session[:cookie_fixed] = true
        redirect_to params[:return_to]
      else
        render text: "<script>top.window.location='?cookie_fix=true&return_to=#{redirect_path}';</script>"
      end
    end
  end
end
