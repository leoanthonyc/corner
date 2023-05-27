class Link < ApplicationRecord
  belongs_to :user

  scope :by_user, ->(user) { where(user: user) }
  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :url, presence: true

  acts_as_taggable_on :tags
end
