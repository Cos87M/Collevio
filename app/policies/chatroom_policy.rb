class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # This method defines which records the user is allowed to see.
    def resolve
      if user.teacher
        # Teachers can see chatrooms associated with their kids.
        scope.where(kid: user.kids)
      else
        # Parents can see chatrooms associated with their children.
        scope.where(kid: user.children)
      end
    end
  end

  # Parents can only see chatrooms associated with their children.
  def show?
    user.children.ids.include?(record.kid.id)
  end
end
