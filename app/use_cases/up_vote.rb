class UpVote
  include ::UseCase

  def initialize(comic_id)
    @comic_id = comic_id
  end

  def perform
    create_or_increase
  end

  private

  attr_reader :comic_id

  def create_or_increase
    comic_vote = repo.find_by_comic_id(comic_id)
    return repo.create_vote_for_comic(comic_id) unless comic_vote.present?
    repo.increment_vote(comic_vote)
  end

  def repo
    @repo ||= ::ComicVoteRepository.new
  end
end
