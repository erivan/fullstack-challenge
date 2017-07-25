require 'rails_helper'

RSpec.describe FetchComics do

  describe '#perform' do

    before do
      ComicVote.create(comic_id: 123, votes: 1)
      ComicVote.create(comic_id: 435, votes: 1)
      ComicVote.create(comic_id: 456, votes: 1)
    end

    let(:subject) { FetchUpVotes.perform.result }

    specify { expect(subject.size).to eql 3 }
    specify { expect(subject.as_json).to all (include('comic_id')) }
  end
end
