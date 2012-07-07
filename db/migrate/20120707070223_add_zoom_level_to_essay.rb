class AddZoomLevelToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :map_zoom_level, :integer
  end
end
