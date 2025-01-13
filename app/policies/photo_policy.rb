class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    # This method defines which records the user is allowed to see.
    def resolve
      scope.all
    end
  end

  # Only teachers are allowed to create new photos.
  def new?
    user.teacher?
  end

  # Only teachers are allowed to create photos.
  def create?
    user.teacher?
  end

  # Only teachers are allowed to destroy photos.
  def destroy?
    user.teacher?
  end
end
