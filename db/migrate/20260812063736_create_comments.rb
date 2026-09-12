class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, null: false, type: :bigint, foreign_key: true
      t.references :post, null: false, type: :bigint, foreign_key: true

      t.timestamps
    end
  end
end