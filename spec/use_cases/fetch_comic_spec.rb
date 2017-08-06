require 'fast_spec_helper'
require 'active_model'
require './app/use_cases/use_case'
require './app/use_cases/fetch_comic'

describe FetchComic, type: [:use_case, :fetch_comic] do

    let(:comics)               { double }
    let(:comic_id)             { 1 }
    let(:fetch_comic_instance) { FetchComic.new(comic_id) }
    let(:spider_man_comic)     { { id: comic_id, title: 'Spider-Man' } }
    let(:result) { [spider_man_comic] }

    before do
      allow(FetchComic).to receive(:new).and_return fetch_comic_instance
      allow(fetch_comic_instance).to receive(:comics).and_return comics
      allow(comics).to receive(:fetch).and_return result
      fetch_comic_instance.perform
    end

    context 'When given a comic id' do

      it 'should fetch_comic_instance result be spider_man_comic ' do
        expect(fetch_comic_instance.result).to eq spider_man_comic
      end

    end

end
