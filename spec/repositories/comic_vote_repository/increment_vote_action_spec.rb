require 'rails_helper'


describe ComicVoteRepository, type: [ :repository, :comic_vote ] do

  describe '#increment_vote' do


    let(:execute_action) { subject.increment_vote comic }

    let(:comic) { create :comic_vote, votes: 5 }

    before do
      execute_action
      comic.reload
    end

    context 'When send a comic with 5 votes as params' do


      it 'should increases votes by 1' do
        expect(comic.votes).to eq 6
      end
    end

  end
end
