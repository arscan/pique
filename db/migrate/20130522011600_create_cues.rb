class CreateCues < ActiveRecord::Migration
  def up
    create_table :cues, id: false do |t|
      t.uuid :id, primary_key: true
      t.string :name

      t.timestamps
    end

    add_index :cues, :id
  end

  def down
    drop_table :cues
  end
end
