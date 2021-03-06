class Post < ApplicationRecord
    belongs_to :account
    belongs_to :community
    has_many :comments
    has_many :votes
    validates_presence_of :title, :body, :account_id, :community_id

    def score
        if self.upvotes > 0 || self.downvotes > 0
            self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
        else
            0
        end
    end
end