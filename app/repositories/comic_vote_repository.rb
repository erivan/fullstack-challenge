class ComicVoteRepository

  def initialize(repository = ComicVote)
    @repository = repository
  end

  def find_by_comic_id(comic_id)
    @repository.find_by_comic_id(comic_id)
  end


end
