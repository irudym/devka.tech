class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :text
      t.timestamps
    end
    add_index :tags, :text, unique: true
  end
end
