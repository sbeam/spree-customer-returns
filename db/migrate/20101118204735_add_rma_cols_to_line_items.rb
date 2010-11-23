class AddRmaColsToLineItems < ActiveRecord::Migration
  def self.up
      add_column :line_items, :rma_qty, :integer
      add_column :line_items, :rma_reason_text, :string
      add_column :line_items, :rma_reason_code, :integer
  end

  def self.down
      drop_column :line_items, :rma_qty
      drop_column :line_items, :rma_reason_text
      drop_column :line_items, :rma_reason_code
  end
end
