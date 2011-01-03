class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_current_user

   def require_login
    redirect_to root_path if current_user.nil?
  end

  def get_current_user
    @current_user = current_user
  end

  protected
  def open_id_authentication(openid_url)
    authenticate_with_open_id(openid_url, :required => ['http://axschema.org/contact/email']) do |result, identity_url, registration|
      openid = request.env[Rack::OpenID::RESPONSE]
      ax     = OpenID::AX::FetchResponse.from_success_response(openid)
      debugger
      if openid.status == :success
        self.current_user = User.where(:mail => ax.get_single('http://axschema.org/contact/email'), :active => true).first
        redirect_to root_url
      else
        redirect_to fail_path
      end
    end
  end

  def current_user
    current_user = nil
    begin
      current_user = User.where(:id => session[:current_id]).first
    rescue => e
    end
    current_user
  end

  def current_user=(new_user)
    session[:current_id] = new_user.nil? ? 0 : new_user.id
  end

end
