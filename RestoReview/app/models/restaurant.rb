class Restaurant < ActiveRecord::Base

  has_many  :reviews, dependent: :destroy
  validates :name, presence:true, uniqueness: true
  validates :address, presence:true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"],
    message: "%{value} is not a valid category" }
end

