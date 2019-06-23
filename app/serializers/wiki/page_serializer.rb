module Wiki
  class PageSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :title, :body
    belongs_to :campaign
    has_many :secrets
  end
end
