class Message < ApplicationRecord
  # belongs_to :user
  # validates :user_id, presence: true
  # default_scope -> { order(created_at: :desc) }
  after_create_commit { MessageBroadcastJob.perform_later self }
  
end
