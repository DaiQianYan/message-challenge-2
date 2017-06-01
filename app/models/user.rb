class User < ApplicationRecord
  def avatar_url
    "https://robohash.org/#{id}.png?set=set3"
  end
end
