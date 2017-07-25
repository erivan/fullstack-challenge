class FetchUpVotes
  include ::UseCase

  attr_reader :result

  def perform
    @result = ComicVote.select(:comic_id).to_a
  end
end