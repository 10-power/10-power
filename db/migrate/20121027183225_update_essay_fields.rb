class UpdateEssayFields < ActiveRecord::Migration
  def change
    remove_column :essays, :photo_1
    remove_column :essays, :photo_1_caption
    remove_column :essays, :photo_2
    remove_column :essays, :photo_2_caption
    remove_column :essays, :photo_3
    remove_column :essays, :photo_3_caption
    remove_column :essays, :photo_4
    remove_column :essays, :photo_4_caption
    remove_column :essays, :photo_5
    remove_column :essays, :photo_5_caption
    remove_column :essays, :photo_6
    remove_column :essays, :photo_6_caption
    remove_column :essays, :photo_7
    remove_column :essays, :photo_7_caption
    remove_column :essays, :photo_8
    remove_column :essays, :photo_8_caption
    remove_column :essays, :photo_9
    remove_column :essays, :photo_9_caption
    remove_column :essays, :photo_10
    remove_column :essays, :photo_10_caption

    add_column :essays, :is_featured, :boolean, :default => false
    add_column :essays, :is_active, :boolean, :default => false
    add_column :essays, :contact_name, :string
    add_column :essays, :contact_email, :string
    add_column :essays, :notes, :text
  end

  def down
  end
end
