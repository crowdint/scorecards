module ApplicationHelper
  def user_login(current_user)
    if current_user.nil?
     link_to 'log in', login_path
    else
      link_to 'logout', logout_path
    end
  end
end
