class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :owner, null: true, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.string :place, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
