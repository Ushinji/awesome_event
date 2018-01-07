require "rails_helper"

describe UsersController do
  describe 'GET /users/:id' do
    context 'ログイン中の場合' do
      before do
        @user = create(:user)
        session[:user_id] = @user.id
      end

      it 'レスポンスが200/OKを返すこと' do
        get :show, params: { id: @user }
        expect(response).to have_http_status :ok
      end

      it ':showテンプレートを返すこと' do
        get :show, params: { id: @user }
        expect(response).to render_template :show
      end
    end

    context '未ログインの場合' do
      before do
        @user = create(:user)
      end

      it 'ルートページへ移動' do
        get :show, params: { id: @user }
        expect(response).to redirect_to root_path
      end
    end
  end
end