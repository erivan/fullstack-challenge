require 'rails_helper'

describe ::ComicVote, type: :model do

  describe '#upvote' do

    subject { ComicVote }

    let(:trigger)   { subject.upvote(comic_id: comic_id) }

    context 'When upvote is triggered with a comic_id as params' do
      let(:comic_id) { 1 }

      it 'should increment ComicVote by 1' do
        expect { trigger }.to change { subject.all.count }.by(1)
      end

    end

    context 'When upvote is triggered with a invalid comic_id as params' do
      let(:comic_id) { 'invalid_id' }

      it 'should not increment ComicVote' do
        expect { trigger }.to change { subject.all.count }.by(0)
      end

      it 'should not be valid' do
        expect(trigger).to_not be_valid
        expect(trigger.errors[:comic_id]).to eq ['is not a number']
      end

    end

  end
end
