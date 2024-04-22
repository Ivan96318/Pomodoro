class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :short_description, null: false
      t.text :long_description
      t.integer :status, default: 0, null: false
      t.time :due_date
      t.references :project, null: false, foreign_key: true
      t.references :assigned_to, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
