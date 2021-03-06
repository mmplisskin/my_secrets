class Post < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true, length: {minimum: 8}
  validates :description, presence: true

  belongs_to :ouser

  has_many :post_recipients,  dependent: :delete_all
  has_many :recipients, through: :post_recipients

  accepts_nested_attributes_for :post_recipients
  accepts_nested_attributes_for :recipients

  attr_encrypted :description, random_iv: true, compress: true

end
