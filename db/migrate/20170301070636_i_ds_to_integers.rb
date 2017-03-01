class IDsToIntegers < ActiveRecord::Migration[5.0]
  def change
    remove_column :authorships, :book_id, :string
    remove_column :authorships, :author_id, :string
    add_column :authorships, :book_id, :integer
    add_column :authorships, :author_id, :integer
  end
end
