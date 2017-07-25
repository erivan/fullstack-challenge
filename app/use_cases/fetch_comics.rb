require 'comics'

class FetchComics
  include ::UseCase

  attr_reader :result

  def initialize(search_params:, comics: Comics)
    @search_params = search_params
    @comics = comics
  end

  def perform
    @result = fetch_comics
  end

  private

  attr_reader :comics

  def fetch_comics
    comics.search(@search_params)
  end
end
