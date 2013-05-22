class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :body
      t.references :cue

      t.timestamps
    end
    add_index :items, :cue_id
  end

  def down
    drop_table :items
  end
end
