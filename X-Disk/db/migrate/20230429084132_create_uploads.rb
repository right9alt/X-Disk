class CreateUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :uploads do |t|
      t.references :user, null: false, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
