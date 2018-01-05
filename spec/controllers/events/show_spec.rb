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
  end
end