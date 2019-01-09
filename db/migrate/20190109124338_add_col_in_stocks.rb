class AddColInStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :highest, :string
    add_column :stocks, :lowest, :string
  end
end
