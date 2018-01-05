require "rails_helper"

describe EventsController do
  describe 'POST /events' do
    before do
      user = create(:user)
      session[:user_id] = user.id
    end

    let(:valid_params) {
      { event:
        {
          name: 'VALID_NAME',
          place: 'VALID_PLACE',
          start_time: Time.current,
          end_time: Time.current + 1,
          content: 'VALID_CONTENT',
        }
      }
    }

    let(:invalid_params) {
      { event:
        {
          name: '',
          place: '',
          start_time: 0,
          end_time: 0,
          content: '',
        }
      }
    }

    context '有効なパラメータの場合' do
      before do
        valid_params
      end

      it 'レスポンスが302であること' do
        post 'create', { params: valid_params }
        expect(response.status).to eq 302
      end

      it 'root_pathへリダイレクトされること' do
        post 'create', { params: valid_params }
        expect(response).to redirect_to root_path
      end

      it 'Eventテーブルの件数が1件増えること' do
        expect{
          post 'create', { params: valid_params }
        }.to change(Event, :count).by(1)
      end
    end


    context '無効なパラメータの場合' do
      before do
        invalid_params
      end

      it 'レスポンスが200/OKであること' do
        post 'create', { params: invalid_params }
        expect(response.status).to eq 200
      end

      it ':newテンプレートが表示されること' do
        post 'create', { params: invalid_params }
        expect(response).to render_template :new
      end

      it 'Eventテーブルの件数が増えないこと' do
        expect{
          post 'create', { params: invalid_params }
        }.to change(Event, :count).by(0)
      end
    end
  end
end