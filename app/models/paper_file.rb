# == Schema Information
#
# Table name: paper_files
#
#  id         :integer          not null, primary key
#  data       :string
#  filename   :string
#  filetype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaperFile < ApplicationRecord
  has_many :papers, through: :paper_relations, dependent: :destroy
  has_many :paper_relations

  accepts_nested_attributes_for :papers

  mount_uploader :data, FileUploader
end
