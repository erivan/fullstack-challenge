require 'rails_helper'

RSpec.describe Api::ComicsController, type: :controller do

  describe 'GET /comics' do

    before do
      VCR.use_cassette('comics') do
        get 'index', format: :json
      end
    end

    specify { expect(response).to match_response_schema("comics") }
    specify { expect(response.status).to eq 200 }
  end

  describe 'PUT /comics/:comic_id/upvote' do

    before { put :upvote, params: { comic_id: 123 } }

    specify { expect(response.status).to eq 200 }
    specify { expect(response).to match_response_schema('upvote') }
  end

  describe 'GET /comics/upvotes' do

    before do
      ComicVote.create(comic_id: 123, votes: 1)
      ComicVote.create(comic_id: 435, votes: 1)
      ComicVote.create(comic_id: 456, votes: 1)

      get 'upvotes', format: :json
    end

    specify { expect(response.status).to eq 200 }
    specify { expect(response).to match_response_schema("upvotes") }
  end
end
