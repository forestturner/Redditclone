class DeleteSubId < ActiveRecord::Migration
  def change
    remove_column :posts, :sub_id
    create_table :post_subs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      t.timestamps 
    end
  end
end
