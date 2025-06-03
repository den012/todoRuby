class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # app/models/user.rb
  validates :email, uniqueness: { case_sensitive: false }
end
