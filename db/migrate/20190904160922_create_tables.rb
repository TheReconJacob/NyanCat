class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :content
    end
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :date
      t.string :image
    end
  end
end
