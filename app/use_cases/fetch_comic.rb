require 'comics'

class FetchComic
  include ::UseCase

  attr_reader :result

  def initialize(comic_id, comics: Comics)
    @comic_id = comic_id
    @comics = comics
  end

  def perform
    @result = fetch_comic.try(:first)
  end

  private

  attr_reader :comics, :comic_id

  def fetch_comic
    comics.fetch(comic_id)
  end
end
