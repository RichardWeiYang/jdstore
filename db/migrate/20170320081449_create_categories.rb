class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end

  add_column :products, :category_id, :integer
  add_index  :products, :category_id
end
