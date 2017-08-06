require 'rails_helper'


describe ComicVoteRepository, type: [ :repository, :comic_vote ] do

  describe '#increment_vote' do


    let(:result) { subject.increment_vote comic }

    before do
      result
    end

    context 'When send a comic with 5 votes as params' do

      let(:comic) { create :comic_vote, votes: 5 }

      it 'should increases votes by 1' do
        expect(result.votes).to eq 6
      end
    end

  end
end
