class CreatePaperRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :paper_relations do |t|
      t.belongs_to :paper, index: true
      t.belongs_to :paper_file, index: true
      t.timestamps
    end

    add_index :paper_relations, [:paper_id, :paper_file_id], unique: true
  end
end
