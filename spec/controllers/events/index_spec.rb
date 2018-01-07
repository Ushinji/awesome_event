require "rails_helper"

describe EventsController do
  describe 'GET /events/' do
    before do
      user = create(:user)
      session[:user_id] = user.id
      10.times do |n|
        create(:event)
      end
      @events = Event.all
    end

    it 'レスポンスが200/OKを返すこと' do
      get :index
      expect(response).to have_http_status :ok
    end

    it 'indexテンプレートを返すこと' do
      get :index
      expect(response).to render_template :index
    end
  end
end