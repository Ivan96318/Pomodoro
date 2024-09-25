class AddCascadeDeleteToTickets < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :tickets, :projects
    add_foreign_key :tickets, :projects, on_delete: :cascade
  end
end
