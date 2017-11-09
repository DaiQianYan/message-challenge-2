module UsersHelper
    
    # Returns the Gravatar for the given user.
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        gravatar_url = "https://robohash.org/#{gravatar_id}.png?set=set3"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

    def avatar_url
        "https://robohash.org/#{id}.png?set=set3"
    end

end