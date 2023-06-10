class Click < ApplicationRecord
  belongs_to :user
  belongs_to :clickable, polymorphic: true
end
