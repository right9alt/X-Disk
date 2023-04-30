require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe "POST #create" do
    context "с валидными данными" do
      it "перенаправляет на диск" do
        post :create, params: { login: user.login, password: user.password }
        expect(response).to redirect_to(storage_path)
      end

      it "устанавливает user_id в сессию" do
        post :create, params: { login: user.login, password: user.password }
        expect(session[:user_id]).to eq(user.id)
      end
    
      it "устанавливает уведомление об успешной авторизации" do
        post :create, params: { login: user.login, password: user.password }
        expect(flash[:notice]).to eq("Вы успешно вошли в систему.")
      end
    end

    context "с некорректными учетными данными" do
      it "перенаправляет на страницу входа" do
        post :create, params: { login: user.login, password: "wrong_password" }
        expect(response).to redirect_to(login_path)
      end
    
      it "устанавливает предупреждение о неверных учетных данных" do
        post :create, params: { login: user.login, password: "wrong_password" }
        expect(flash[:alert]).to eq("Неверные логин или пароль.")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      session[:user_id] = user.id
    end

    it "удаляет сессию пользователя" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
    
    it "перенаправляет на главную страницу" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
    
    it "устанавливает уведомление об успешном выходе" do
      delete :destroy
      expect(flash[:notice]).to eq("Вы успешно вышли из системы.")
    end
  end
end
