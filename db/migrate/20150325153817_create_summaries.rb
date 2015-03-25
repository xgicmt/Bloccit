class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :summary

      t.timestamps null: false
    end
  end
end
