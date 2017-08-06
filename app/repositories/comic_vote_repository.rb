class ComicVoteRepository

  def initialize(repository = ComicVote)
    @repository = repository
  end

  def find_by_comic_id(comic_id)
    repository.find_by(comic_id: comic_id)
  end

  def create_vote_for_comic(comic_id)
    repository.create(comic_id: comic_id, votes: 1)
  end

  private

  attr_reader :repository
end
