RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "с валидными параметрами" do
      let(:user_params) { { login: "username", password: "Passw0rd!", password_confirmation: "Passw0rd!" } }

      it "создает нового пользователя" do
        expect {
          post :create, params: { user: user_params }
        }.to change(User, :count).by(1)
      end
    
      it "перенаправляет на storage_path" do
        post :create, params: { user: user_params }
        expect(response).to redirect_to(storage_path)
      end
    end

    context "с невалидными параметрами" do
      let(:user_params) { { login: "username", password: "password", password_confirmation: "password" } }
    
      it "не создает нового пользователя" do
        expect {
          post :create, params: { user: user_params }
        }.not_to change(User, :count)
      end
    
      it "устанавливает сообщение об ошибке" do
        post :create, params: { user: user_params }
        expect(flash[:error]).to eq("Пароль имеет недопустимый формат")
      end
    
      it "возвращает статус unprocessable_entity" do
        post :create, params: { user: user_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
