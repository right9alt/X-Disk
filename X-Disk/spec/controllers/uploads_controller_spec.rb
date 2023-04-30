RSpec.describe UploadsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_file) { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_file.docx')) }
  let(:invalid_file) { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'invalid_file.pdf')) }

  before do
    session[:user_id] = user.id
  end

  describe "#create" do
    context "with valid file" do
      it "creates a new upload" do
        expect {
          post :create, params: { upload: { file: valid_file } }
        }.to change(user.uploads, :count).by(1)
      end

      it "redirects to storage path with success notice" do
        post :create, params: { upload: { file: valid_file } }
        expect(response).to redirect_to(storage_path)
        expect(flash[:notice]).to eq('Файл успешно загружен.')
      end
    end

    context "with invalid file" do
      it "does not create a new upload" do
        expect {
          post :create, params: { upload: { file: invalid_file } }
        }.not_to change(user.uploads, :count)
      end
    end
  end

  describe "#destroy" do
    let!(:upload) { FactoryBot.create(:upload, user: user) }
  
    it "destroys the upload" do
      expect {
        delete :destroy, params: { id: upload.id }
      }.to change(Upload, :count).by(-1)
    end
  
    it "redirects to storage path" do
      delete :destroy, params: { id: upload.id }
      expect(response).to redirect_to(storage_path)
    end
  end
  
end
