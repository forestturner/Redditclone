# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true

  #has_many :post_, dependent: :destroy, inverse_of: :cat

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :moderator_id,
  class_name:  :User

  has_many :post_subs,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: :PostSub

  has_many :posts,
  through: :post_subs,
  source: :post




end
