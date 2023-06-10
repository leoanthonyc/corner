module Clickable
  extend ActiveSupport::Concern

  def click!
    Click.create!(clickable: self, user: Current.user)
  end
end
