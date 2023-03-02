class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
