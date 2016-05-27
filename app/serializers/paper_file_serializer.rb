class PaperFileSerializer < ActiveModel::Serializer
  attributes :id, :data, :filename, :filetype, :from_who
end
