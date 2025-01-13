class ApplicationRecord < ActiveRecord::Base
  # This sets the class as an abstract class, meaning it is intended to be inherited from and not instantiated directly.
  primary_abstract_class
end
