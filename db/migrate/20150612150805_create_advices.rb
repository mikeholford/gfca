class CreateAdvices < ActiveRecord::Migration
  def change
    create_table :advices do |t|
      t.text :body
      t.boolean :live, default: true

      t.timestamps null: false
    end
  end
end
