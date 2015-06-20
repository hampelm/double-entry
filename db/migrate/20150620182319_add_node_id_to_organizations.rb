class AddNodeIdToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :nid, :int
  end
end
