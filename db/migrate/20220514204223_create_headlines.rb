class CreateHeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :headlines do |t|
      t.string :image_url
      t.string :title
      t.string :content
      t.string :author

      t.timestamps
    end
  end
end
