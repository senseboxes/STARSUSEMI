class CreateCscenters < ActiveRecord::Migration[5.1]
  def change
    create_table :cscenters do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
