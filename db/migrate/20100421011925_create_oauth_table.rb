class CreateOauthTable < ActiveRecord::Migration
  def self.up
    create_table :oauth_tokens do |t|
      t.references :tenant
      t.string :key, :limit => 20, :default => "", :null => false
      t.string :secret, :limit => 40, :default => "", :null => false
      t.timestamps
    end
    add_index :oauth_tokens, :key, :unique
  end

  def self.down
    drop_table :oauth_tokens
  end
end
