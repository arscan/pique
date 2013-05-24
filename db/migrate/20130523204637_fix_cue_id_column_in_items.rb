class FixCueIdColumnInItems < ActiveRecord::Migration
  def up
    remove_column :items, :cue_id
    add_column :items, :cue_id, :uuid
  end

  def down
    remove_column :items, :cue_id
    add_column :items, :cue_id, :integer
  end
end
