require 'fast_spec_helper'
require 'active_model'
require './app/use_cases/use_case'
require './app/use_cases/fetch_up_votes'

RSpec.describe FetchUpVotes do

  describe '#perform' do


    let(:repository) { double }
    let(:result)     { }
    let(:fetch_up_votes_instance) { FetchUpVotes.new }

    before do
      allow(FetchUpVotes).to receive(:new).and_return fetch_up_votes_instance
      allow(fetch_up_votes_instance).to receive(:repo).and_return repository
      allow(repository).to receive(:all_comics_id).and_return result
      fetch_up_votes_instance.perform
    end

    context 'When there are comics registered' do

      let(:comic_id) { 12 }
      let(:comic) { {comic_id: comic_id} }
      let(:result) { [comic] }

      it 'should result be a array with 1 comic' do
        expect(fetch_up_votes_instance.result.size).to be 1
      end
      it 'should include comic_id in result' do
        expect(fetch_up_votes_instance.result.as_json).to all (include('comic_id' => 12))
      end

    end

    context 'When there are no comics' do

       it 'should result be a array with 1 comic' do
        expect(fetch_up_votes_instance.result.size).to be 0
      end
   end
  end
end
