module Wiki
  class Page < ApplicationRecord
    belongs_to :campaign
    has_many :secrets, class_name: 'Wiki::Secrets'
  end
end
