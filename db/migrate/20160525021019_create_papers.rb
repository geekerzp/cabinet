class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :body
      t.string :uuid

      t.timestamps
    end
  end
end
