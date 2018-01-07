require "rails_helper"

describe EventsController do
  describe 'DELETE /events/:id' do
    context '存在するEventの場合' do
      before do
        user = create(:user)
        session[:user_id] = user.id
        @event = create(:event)
      end

      it 'レスポンスが、302/foundを返すこと' do
        post :destroy, params: { id: @event }
        expect(response).to have_http_status :found
      end

      it 'ルートページへリダイレクトすること' do
        post :destroy, params: { id: @event }
        expect(response).to redirect_to root_path
      end
    end

    context '存在しないEventの場合' do
      before do
        user = create(:user)
        session[:user_id] = user.id
      end

      it 'レスポンスが、404/NotFoundを返すこと' do
        post :destroy, params: { id: 0 }
        expect(response).to have_http_status :not_found
      end

      it '404.htmlを表示すること' do
        post :destroy, params: { id: 0 }
        expect(response).to render_template(:file => Rails.root.join('public/404.html').to_s)
      end
    end
  end
end