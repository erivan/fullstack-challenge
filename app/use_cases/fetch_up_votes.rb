class FetchUpVotes
  include ::UseCase

  attr_reader :result

  def perform
    @result = repo.all_comics_id.to_a
  end


  private

  def repo
    @repo ||= ::ComicVoteRepository.new
  end

end
