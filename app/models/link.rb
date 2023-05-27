class Link < ApplicationRecord
  belongs_to :user

  scope :by_user, ->(user) { where(user: user) }
  scope :recent, -> { order(created_at: :desc) }
end
