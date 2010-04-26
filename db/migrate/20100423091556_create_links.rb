class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.references :tenant, :null => false
      t.string :title, :default => "", :null => false
      t.string :url, :default => "", :null => false
      t.string :comment, :default => ""
      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
