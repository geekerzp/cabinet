class PaperFileSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :data, :filename, :filetype, :from_who
end
