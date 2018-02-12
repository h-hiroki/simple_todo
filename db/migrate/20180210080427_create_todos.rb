class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string      :title, null: false, default: ""
      t.datetime    :do_date, null: false
      t.integer     :status, null: false, default: 0
      t.timestamps  null: false
      t.datetime    :deleted_at, null: false, default: 0
    end
  end
end
