class CreateSeances < ActiveRecord::Migration[7.0]
  def change
    create_table :seances do |t|
      t.belongs_to :user , foreign_key: true
      t.string :name
      t.string :exercice, array: true, default: []

      t.timestamps
    end
  end
end
