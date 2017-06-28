class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.column :content, :string
      t.column :author, :string
      t.column :story_id, :integer
      t.column :image_id, :integer

      t.timestamps
    end
  end
end
