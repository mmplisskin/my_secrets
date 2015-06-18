class Post < ActiveRecord::Base
  
  validates :title, presence: true

  belongs_to :user
  has_many :post_recipients
  has_many :recipients, through: :post_recipients
  accepts_nested_attributes_for :post_recipients
  accepts_nested_attributes_for :recipients
end
