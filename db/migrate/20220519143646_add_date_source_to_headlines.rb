class AddDateSourceToHeadlines < ActiveRecord::Migration[7.0]
  def change
    add_column :headlines, :date, :datetime
    add_column :headlines, :source, :string
  end
end
