class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :list, index: true, foreign_key: true
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
