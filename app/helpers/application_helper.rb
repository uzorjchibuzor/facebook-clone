# frozen_string_literal: true

module ApplicationHelper
  # def logged_in_only
  #     unless user_signed_in?
  #       flash[:warning] = "You need to Sign in first"
  #       redirect_to unauthenticated_root_url
  #   end
  # end

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.first_name, class: 'gravatar')
  end

  def profile_picture(user)
    if user.avatar.url == '/avatars/original/missing.png'
      gravatar_for user
    else
      image_tag(user.avatar.url, alt: user.full_name, class: 'gravatar')
    end
  end
end
