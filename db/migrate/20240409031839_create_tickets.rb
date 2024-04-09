class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :short_description
      t.text :long_description
      t.integer :status
      t.references :project, null: false, foreign_key: true
      t.references :assigned_to, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
