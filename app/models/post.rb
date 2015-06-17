class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_recipients
  has_many :recipients, through: :post_recipients
  accepts_nested_attributes_for :post_recipients
end
