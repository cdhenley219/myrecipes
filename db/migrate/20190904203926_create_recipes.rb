class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string  :title
      t.text    :description
      t.integer :minutes
      t.string  :image_url
      t.text    :instructions
      t.timestamps
    end
  end
end
