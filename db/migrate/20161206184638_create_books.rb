class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :facility
      t.text :content

      t.timestamps
    end
    #add_index :books, [:user_id, :created_at]
  end
end
