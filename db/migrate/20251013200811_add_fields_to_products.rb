class AddFieldsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :name, :string
    add_column :products, :size, :string
    add_column :products, :price, :decimal
  end
end
