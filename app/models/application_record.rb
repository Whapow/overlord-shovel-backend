class ApplicationRecord < ActiveRecord::Base
  include Discard::Model
  self.abstract_class = true
end
