class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    # This method defines which records the user is allowed to see.
    def resolve
      scope.all
    end
  end

  # Anyone is allowed to create messages.
  def create?
    true
  end
end
