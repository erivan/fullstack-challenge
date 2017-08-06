require 'rails_helper'

describe ComicVoteRepository, type: [:repository, :comic_vote] do


  describe '#all_comics_id' do

    let(:result) { subject.all_comics_id }
    let(:setup) {  }
    before do
      setup
      result
    end

    context 'When has 2 comics vote ' do
      let(:first_comic_id) { 12 }
      let(:comic)          { create :comic_vote, comic_id: first_comic_id }
      let(:comic_01)       { create :comic_vote }

      let(:setup) do
        comic
        comic_01
      end

      let(:first_result) { result.first }
      it 'should result all comics id' do
        expect(result.count).to be 2
        expect(first_result.comic_id).to be first_comic_id
      end

    end
    context 'When there is no registered comic' do

      it 'should result a empty array' do
        expect(result.to_a).to eq []
      end

    end
  end
end
