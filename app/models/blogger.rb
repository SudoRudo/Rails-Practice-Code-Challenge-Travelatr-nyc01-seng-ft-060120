class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts

validates :name, uniqueness: {case_sensitive: false}
validates :name, :bio, :age, presence: true
validates :bio, length: {minimum: 30}
validates :age, numericality: {greater_than: 0}

def count_likes
    all_posts = self.posts.map do |post|
        post.likes
    end
    all_posts.sum
end

end
