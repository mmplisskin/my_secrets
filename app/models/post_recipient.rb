class PostRecipient < ActiveRecord::Base
  belongs_to :post
  belongs_to :recipient
  accepts_nested_attributes_for :recipient
end
