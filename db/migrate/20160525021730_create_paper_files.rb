class CreatePaperFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :paper_files do |t|
      t.string :uuid
      t.string :data
      t.string :filename
      t.string :filetype
      t.string :from_who

      t.timestamps
    end
  end
end
