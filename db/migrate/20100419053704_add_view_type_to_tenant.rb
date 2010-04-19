class AddViewTypeToTenant < ActiveRecord::Migration
  def self.up
    add_column :tenants, :view_type, :string
  end

  def self.down
    remove_column :tenants, :view_type
  end
end
