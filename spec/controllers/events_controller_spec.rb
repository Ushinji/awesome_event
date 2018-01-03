describe EventsController do
  describe 'POST #create' do
    before do
      @user = build(:user)
    end

    it 'createしたeventがDBへ格納されていること' do
      expect do
        post :create, params: {}
      end.to change(Event, :count).by(1)
    end

  end
end