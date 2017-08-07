module ComicDetailRepresenter
  include Roar::JSON

  property :id
  property :title
  property :issueNumber
  property :images
  property :isbn
  property :variantDescription
  property :creators
  property :characters
end
