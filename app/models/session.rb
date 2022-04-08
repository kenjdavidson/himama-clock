# Provides access to ThreadLocal - internally which is auto cleared after each
# request completes.
#
# @see https://api.rubyonrails.org/classes/ActiveSupport/CurrentAttributes.html
#
class Session < ActiveSupport::CurrentAttributes
  attribute :user

  def user=(user)
    super
    @user = user
  end
end
