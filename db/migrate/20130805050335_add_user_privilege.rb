class AddUserPrivilege < ActiveRecord::Migration
  def change
    add_column :users, :privilege, :string, default: 'normal'
  end
end
