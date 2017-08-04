class ComicVote < ApplicationRecord

  validates :comic_id, numericality: { onyly_integer: true}

  def self.upvote(comic_id:)
    find_or_create_by(comic_id: comic_id).tap do |votes|
      votes.votes += 1
    end
  end
end
