require 'rails_helper'


describe ComicVoteRepository, type: [ :repository, :comic_vote ] do

  describe '#find_by_comic_id' do

    let(:comic_vote) { create :comic_vote, comic_id: comic_id }

    let(:result) { subject.find_by_comic_id comic_id }

    let(:setup) {}

    before do
      setup
    end

    context 'When comic_id belongs to existng ComicVote' do

      let(:comic_id)  { 10 }
      let(:setup)     { comic_vote }

      it 'should result :comic_vote' do
        expect(result).to eq comic_vote
      end
    end

    context 'When comic_id not exist' do

      let(:comic_id) { 2 }

      it 'should result be nil' do
        expect(result).to be nil
      end
    end
  end


end
