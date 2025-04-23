class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.string :document_type
      t.string :status
      t.jsonb :metadata, default: {}

      t.timestamps
    end

    add_index :documents, :document_type
    add_index :documents, :status
  end
end 