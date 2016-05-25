class PaperFileSerializer < ActiveModel::Serializer
  attributes :id, :data, :filename, :filetype
end
