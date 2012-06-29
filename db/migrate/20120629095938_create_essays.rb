class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :title
      t.integer :user_id
      t.string :description
      t.string :photo_1
      t.string :photo_1_caption
      t.string :photo_2
      t.string :photo_2_caption
      t.string :photo_3
      t.string :photo_3_caption
      t.string :photo_4
      t.string :photo_4_caption
      t.string :photo_5
      t.string :photo_5_caption
      t.string :photo_6
      t.string :photo_6_caption
      t.string :photo_7
      t.string :photo_7_caption
      t.string :photo_8
      t.string :photo_8_caption
      t.string :photo_9
      t.string :photo_9_caption
      t.string :photo_10
      t.string :photo_10_caption
      t.timestamps
    end
  end
end
