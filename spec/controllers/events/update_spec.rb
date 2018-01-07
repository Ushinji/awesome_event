require "rails_helper"

describe EventsController do
  describe 'POST /events/:id' do

    let(:valid_params) {
      {
        name: 'UPDATE_NAME',
        place: 'UPDATE_PLACE',
        start_time: rand(1..9).days.from_now.to_s,
        end_time: rand(10..20).days.from_now.to_s,
        content: 'UPDATE_CONTENT',
      }
    }

    let(:invalid_params) {
      {
        name: '',
        place: '',
        start_time: 0,
        end_time: 0,
        content: '',
      }
    }

    describe 'ログイン中の場合' do
      before do
        user = create(:user)
        session[:user_id] = user.id
        @event = create(:event, user: user)
      end

      context '有効なパラメタの場合' do
        before do
          valid_params
        end

        it 'レスポンスのHTTPステータスが200/OKであること' do
          post 'update', params: { id: @event, event: valid_params }
          expect(response).to have_http_status :ok
        end

        it '作成したページの詳細画面が表示されること' do
          post 'update', params: { id: @event, event: valid_params }
          expect(response).to render_template :show
        end

        it 'Eventテーブルの件数が増えないこと' do
          expect{
            post 'update', params: { id: @event, event: valid_params }
          }.to change(Event, :count).by(0)
        end

        it '指定パラメタで更新されていること' do
          post 'update', params: { id: @event, event: valid_params }
          e = Event.find(@event.id)

          expect(e.name).to eq valid_params[:name]
          expect(e.place).to eq valid_params[:place]
          expect(e.start_time).to eq valid_params[:start_time]
          expect(e.end_time).to eq valid_params[:end_time]
          expect(e.content).to eq valid_params[:content]
        end
      end

      context '無効なパラメタの場合' do
        before do
          invalid_params
        end

        it 'レスポンスが200/OKであること' do
          post 'update', params: { id: @event, event: invalid_params }
          expect(response.status).to eq 200
        end
  
        it ':editテンプレートが表示されること' do
          post 'update', params: { id: @event, event: invalid_params }
          expect(response).to render_template :edit
        end
      end
    end

    describe '未ログインの場合' do
      before do
        @event = create(:event)
      end

      it 'トップページへリダイレクトすること' do
        post 'update', params: { id: @event, event: valid_params }
        expect(response).to redirect_to root_path
      end
    end 
  end
end