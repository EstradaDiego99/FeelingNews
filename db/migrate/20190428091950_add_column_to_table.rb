class AddColumnToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :post_id, :integer
  end
end
