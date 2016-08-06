class Comment < ActiveRecord::Base
  validates :user_id, :content, :post_id, presence: true

  belongs_to :user
  belongs_to :post

  belongs_to :parent,
  primary_key: :id,
  foreign_key: :parent_id,
  class_name: :Comment

  has_many :children,
  primary_key: :id,
  foreign_key: :parent_id,
  class_name: :Comment

end
