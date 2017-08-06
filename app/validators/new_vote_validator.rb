class NewVoteValidator
  include ActiveModel::Validations

  def initialize(params)
    @comic_id = params[:comic_id]
  end


  private
  attr_reader :comic_id

  validates :comic_id, presence: true
  validate :comic_id, :uniqueness, if: 'comic_id.present?'

  def uniqueness
    self.errors.add(:base, 'this comic id already registered') if repo.find_by_comic_id(comic_id).present?
  end

  def repo
    @repo ||= ComicVoteRepository.new
  end


end

