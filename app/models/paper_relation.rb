# == Schema Information
#
# Table name: paper_relations
#
#  id            :integer          not null, primary key
#  paper_id      :integer
#  paper_file_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PaperRelation < ApplicationRecord
  belongs_to :paper
  belongs_to :paper_file
end
