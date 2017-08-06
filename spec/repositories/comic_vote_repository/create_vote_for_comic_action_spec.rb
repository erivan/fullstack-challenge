require 'rails_helper'


describe ComicVoteRepository, type: [ :repository, :comic_vote ] do

  describe '#create_vote_for_comic' do

    let(:result) { subject.create_vote_for_comic comic_id }

    context 'When create new vote for a comic' do

      let(:comic_id)  { 10 }

      it 'should result :comic_vote' do
        expect(result.comic_id).to eq comic_id
        expect(result.votes).to eq 1
      end
    end

  end


end
