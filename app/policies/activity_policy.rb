class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    # This method defines which records the user is allowed to see.
    attr_reader :user

    def resolve
      if user.teacher
        # Teachers can see activities associated with their kids.
        scope.where(kid: user.kids)
      else
        # Parents can see activities associated with their children.
        scope.where(kid: user.children)
      end
    end
  end

  # Anyone is allowed to view activities.
  def show?
    true
  end

  # Anyone is allowed to create new activities.
  def new?
    create?
  end

  # Anyone is allowed to create activities.
  def create?
    true
  end

  # Edit action follows update policy.
  def edit?
    update?
  end

  # Only teachers are allowed to update activities.
  def update?
    user.teacher? == true
  end

  # Define destroy method (currently empty).
  def destroy?
  end
end
