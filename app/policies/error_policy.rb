class ErrorPolicy < ApplicationPolicy
  def not_found?
    true # or return true if the user is authorized to view the not_found page
  end
end
