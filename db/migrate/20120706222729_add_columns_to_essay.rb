class AddColumnsToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :needs, :text
    add_column :essays, :location, :string
    add_column :essays, :lat, :float
    add_column :essays, :lng, :float
  end
end
