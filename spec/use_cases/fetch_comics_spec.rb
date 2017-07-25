require 'rails_helper'

RSpec.describe FetchComics do

  describe "#perform" do

    let(:api_result) { [{ title: 'x-man'}, {title: 'deadpool'}] }
    let(:comics) { class_double('Comics') }

    context 'when requests comics on page 0' do
      it 'returns comics from api with offset equals 0' do
        allow(comics).to(
          receive(:search)
          .with(
            {
              title: 'x-men',
              page: 0
            }
          ).and_return(api_result)
        )

        subject = described_class.perform(
          search_params: { title: 'x-men', page: 0 },
          comics: comics
        )

        expect(subject.result).to eq api_result
      end
    end

    context 'when requests comics on page 1' do
      it 'returns comics from api with offset equals 20' do
        allow(comics).to receive(:search).with(
          {
            title: 'x-men',
            page: 1
          }
        ).and_return(api_result)

        subject = described_class.perform(
          search_params: { title: 'x-men', page: 1 },
          comics: comics
        )

        expect(subject.result).to eq api_result
      end
    end

    context 'when no title was given' do
      it 'returns comics from api without title' do
        allow(comics).to(
          receive(:search)
            .with(
              {
                title: nil,
                page: 0
              }
            ).and_return(api_result)
        )

        subject = described_class.perform(
          search_params: { title: nil, page: 0 },
          comics: comics
        )

        expect(subject.result).to eq api_result
      end
    end
  end
end