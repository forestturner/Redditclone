
class PostSub< ActiveRecord::Base
  validates :post,:sub , presence: true



  belongs_to :post,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: :Post
  #inverse_of: :post

  belongs_to :sub,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: :Sub
#inverse_of: :post

end
#
# def change
#   remove_column :posts, :sub_id
#   create_table :post_subs do |t|
#     t.integer :post_id, null: false
#     t.integer :sub_id, null: false
#     t.timestamps
#   end
# # end
# end
