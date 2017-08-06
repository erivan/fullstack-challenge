class Comics

  def self.search(search_params)
    new.search(search_params)
  end
  
  def self.fetch(comic_id)
    new.fetch(comic_id)
  end

  def initialize(api_client = Marvel::Client.new)
    @api_client = api_client
  end

  def search(search_params)
    search_params[:offset] = page_size * search_params.delete(:page).to_i

    @api_client.comics(default_params.merge(search_params))
  end

  def fetch(comic_id)
    @api_client.comic(comic_id)
  end

  def default_params
    {
      orderBy: '-onsaleDate',
      format: 'comic'
    }
  end

  def page_size
    20
  end
end
