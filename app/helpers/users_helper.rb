module UsersHelper
  def link_to_profile(user)
    if user.profile.nil?
      link_to "Create Profile", new_user_profile_url(user)
    else
      link_to "View Profile", user_profile_url(user, user.profile)
    end
  end
end
