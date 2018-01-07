require "rails_helper"

describe EventsController do
  describe 'GET /events/edit/:id' do
    before do
      user = create(:user)
      session[:user_id] = user.id
      @event = create(:event)
    end

    it 'レスポンスが、200/okであること' do
      get 'edit', params: { id: @event }
      expect(response).to have_http_status :ok
    end

    it 'editテンプレートを返すこと' do
      get 'edit', params: { id: @event }
      expect(response).to render_template :edit
    end
  end
end