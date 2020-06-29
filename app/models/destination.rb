class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_likes
        all_posts = self.posts.max_by do |post|
            post.likes
        end
        all_posts
    end

    def blogger_age_avg
        blogger_ages = self.bloggers.map do |blogger|
            blogger.age
        end
        blogger_ages.sum/blogger_ages.count
    end
end
