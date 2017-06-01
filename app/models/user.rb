class User < ApplicationRecord
  def avatar_url
    "https://robohash.org/#{id}.png?set=set2"
  end
end
