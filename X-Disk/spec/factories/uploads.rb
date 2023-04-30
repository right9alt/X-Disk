FactoryBot.define do
  factory :upload do
    user
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_file.docx')) }
  end
end
