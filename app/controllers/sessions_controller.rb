class SessionsController < ApplicationController

  def create
    authenticate_with_open_id("https://www.google.com/accounts/o8/site-xrds?hd=crowdint.com", :required => ['http://axschema.org/contact/email']) do |result, identity_url, registration|
      openid = request.env[Rack::OpenID::RESPONSE]
      ax     = OpenID::AX::FetchResponse.from_success_response(openid)
      if openid.status == :success
        self.current_user = User.where(:mail => ax.get_single('http://axschema.org/contact/email'), :active => true).first
        redirect_to root_url
      else
        redirect_to fail_path
      end
    end
  end

  def delete
    session.clear
    redirect_to root_url
  end
end
