class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true
      t.references :item, foreign_key: true
      t.text :content, limit: 1000, null: false
      t.string :commit
      t.string :controller
      t.boolean :display_status, null: false, default: true
      t.timestamps
    end
  end
end
