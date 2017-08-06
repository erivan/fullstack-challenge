require 'rails_helper'


describe NewVoteValidator, type: [:validator, :comic_vote] do



  let(:params) { {} }

  subject { NewVoteValidator.new params }

  let(:errors) { subject.errors }
  let(:return_option) {  }
  let(:repository) { instance_double ComicVoteRepository }

  before do
    allow(subject).to receive(:repo).and_return repository
    allow(repository).to receive(:find_by_comic_id).with(kind_of(Integer)).and_return return_option
    subject.valid?
  end

  describe '#presence' do

    let(:blank_error_msg) { "can't be blank" }

    context 'When params is invalid' do
      it 'should add erros on ' do
        expect(errors.added? :comic_id, blank_error_msg).to be_truthy
      end

    end

    context 'When params is valid' do

      let(:params) { { comic_id: 1 } }
      it 'should add erros on ' do
        expect(errors.added? :comic_id, blank_error_msg).to be_falsey
      end

    end
  end

  describe '#uniqueness' do

    let(:params) { {comic_id: 1} }
    let(:comic_not_unique_msg) { 'this comic id already registered' }

    context 'When params is invalid' do

      let(:return_option) { instance_double ComicVote }

      it 'should add not unique error on :base' do
        expect(errors.added? :base, comic_not_unique_msg).to be_truthy

      end

    end

    context 'When params is valid' do
      let(:return_option) { nil }

      it 'should not add not unique error on :base' do
        expect(errors.added? :base, comic_not_unique_msg).to be_falsey

      end

    end
  end

end
