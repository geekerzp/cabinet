# == Schema Information
#
# Table name: papers
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Paper < ApplicationRecord
  has_many :paper_files, through: :paper_relations, dependent: :destroy
  has_many :paper_relations

  accepts_nested_attributes_for :paper_files

  validates :body, presence: true
end
