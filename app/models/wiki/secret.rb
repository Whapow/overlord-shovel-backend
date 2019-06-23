module Wiki
  class Secret < ApplicationRecord
    belongs_to :page, class_name: 'Wiki::Pages'
  end
end
