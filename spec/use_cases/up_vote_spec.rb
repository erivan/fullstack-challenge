require 'fast_spec_helper'
require 'active_model'
require './app/validators/new_vote_validator'
require './app/use_cases/use_case'
require './app/use_cases/up_vote'

RSpec.describe UpVote do


  let(:repository)       { double }
  let(:result)           { }
  let(:up_vote_instance) { UpVote.new(comic_id) }
  let(:setup)            { }
  let(:comic_id)         { }
  let(:validator)        { double }
  let(:validator_result) { true }

  before do
    allow(UpVote).to receive(:new).and_return up_vote_instance
    allow(up_vote_instance).to receive(:repo).and_return repository
    allow(NewVoteValidator).to receive(:new).and_return validator
    allow(validator).to receive(:valid?).and_return validator_result
    setup
    up_vote_instance.perform
  end

  context 'When given a new comic_id' do
    let(:comic_id)  { 32 }
    let(:setup) do
      allow(repository).to receive(:find_by_comic_id).and_return nil
      allow(repository).to receive(:create_vote_for_comic).with(kind_of(Integer))
    end

    it 'should repo have received find_by_comic_id and create_vote_for_comic once each' do
      expect(repository).to have_received(:find_by_comic_id).with(comic_id).once
      expect(repository).to have_received(:create_vote_for_comic).with(comic_id).once
    end

  end

  context 'When given a existing comic_id' do

    let(:comic_id) { 1 }
    let(:comic) { double }
    let(:setup) do
      allow(repository).to receive(:find_by_comic_id).and_return comic
      allow(repository).to receive(:increment_vote).with(kind_of(Object))
    end

    it 'should repo have received find_by_comic_id increment_vote once each' do
      expect(repository).to have_received(:find_by_comic_id).with(comic_id).once
      expect(repository).to have_received(:increment_vote).with(comic).once
    end
  end

  context 'When given a invalid comic id' do
    let(:comic_id) { nil }
    let(:validator_result) { false }
    let(:errors) { double(full_messages: 'Invalid Comic') }
    let(:setup) do
      allow(repository).to receive(:find_by_comic_id).and_return nil
      allow(validator).to receive(:errors).and_return errors
    end

    it 'should up_vote_instance contains errors' do
      expect(up_vote_instance.errors).to_not be_nil
    end

  end
end
