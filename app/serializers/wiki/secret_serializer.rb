module Wiki
  class SecretSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :title, :content
    belongs_to :page
  end
end
