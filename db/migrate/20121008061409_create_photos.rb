class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :essay_id
      t.string :file
      t.string :content_type
      t.string :file_size
      t.string :width
      t.string :height
      t.string :caption
      t.integer :position

      t.timestamps
    end
  end
end
