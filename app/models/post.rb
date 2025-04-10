class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :prefectures, presence: true
  validates :domicile, presence: true 
  def self.search_for(content, method, columm)
    if method == 'perfect'
      Post.where("#{columm}": content)
    elsif method == 'forward'
      post.where("#{columm} LIKE ?", content+'%')
    elsif method == 'backward'
      Post.where("#{columm} LIKE ?", '%'+content)
    else
      Post.where("#{columm} LIKE ?", '%'+content+'%')
    end
  end
end
