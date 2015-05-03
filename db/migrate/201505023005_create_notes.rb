class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |table|
      table.string :title
      table.string :content
      table.string :created_at

      table.timestamps
    end
  end
end
