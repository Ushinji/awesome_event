require "rails_helper"

describe EventsController do
  describe 'GET /events/:id' do

    context '存在するEventの場合' do
      before do
        @event = create(:event)
      end

      it 'レスポンスが200/OKを返すこと' do
        get :show, params: { id: @event }
        expect(response).to have_http_status :ok
      end

      it ':showテンプレートを返すこと' do
        get :show, params: { id: @event }
        expect(response).to render_template :show
      end
    end

    context '存在しないEventの場合' do
      it 'レスポンスが、404/NotFoundを返すこと' do
        get :show, params: { id: 0 }
        expect(response).to have_http_status :not_found
      end

      it '404.htmlを表示すること' do
        get :show, params: { id: 0 }
        expect(response).to render_template(:file => Rails.root.join('public/404.html').to_s)
      end
    end
  end
end