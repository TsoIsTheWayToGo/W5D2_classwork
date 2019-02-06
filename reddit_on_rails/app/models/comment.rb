class Comment < ApplicationRecord 
  validates :content, presence: true 

  belongs_to :author 
  belongs_to :parent_comment, class_name: :Comment, optional: true 
  has_one :post, through: :author 
  has_many :child_comments 
end 
