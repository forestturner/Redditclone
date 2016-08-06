class Comment < ActiveRecord::Base
  validates :user_id, :content, :post_id, presence: true

  belongs_to :user
  belongs_to :post

  

end
