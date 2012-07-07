class AddCoverImageToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :cover_image_id, :integer
  end
end
