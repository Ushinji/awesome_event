require "rails_helper"

describe ParticipationsController do
  describe 'DELETE /events/:id/cancel/' do

    context '未ログインの場合' do
      before do
        @event = create(:event)
      end

      it 'ホーム画面へリダイレクトされること' do
        post 'destroy', params: { id: @event.id }
        expect(response).to redirect_to root_path
      end
    end


    context 'ログイン中の場合' do
      before do
        user = create(:user)
        session[:user_id] = user.id
        @event = create(:event)
        @event.participations.create(user_id: user.id)
      end

      it 'レスポンスのHTTPステータスが302/Foundであること' do
        post 'destroy', params: { id: @event.id }
        expect(response).to have_http_status :found
      end

      it '作成したページの詳細画面が表示されること' do
        post 'destroy', params: { id: @event.id }
        expect(response).to redirect_to "/events/#{@event.id}"
      end

      it 'Participationsテーブルの件数が1件減ること' do
        expect{
          post 'destroy', params: { id: @event.id }
        }.to change(Participation, :count).by(-1)
      end
    end


  end
end