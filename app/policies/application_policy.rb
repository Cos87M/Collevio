# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  # Initializes the policy with the user and the record being accessed.
  def initialize(user, record)
    @user = user
    @record = record
  end

  # Default policy: deny access to index action.
  def index?
    false
  end

  # Default policy: deny access to show action.
  def show?
    false
  end

  # Default policy: deny access to create action.
  def create?
    false
  end

  # Default policy: new action follows create policy.
  def new?
    create?
  end

  # Default policy: deny access to update action.
  def update?
    false
  end

  # Default policy: edit action follows update policy.
  def edit?
    update?
  end

  # Default policy: deny access to destroy action.
  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    # This method should be overridden in subclasses to define which records the user is allowed to see.
    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
