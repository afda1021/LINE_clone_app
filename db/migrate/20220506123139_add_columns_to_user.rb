class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, after: :name
    add_column :users, :status_message, :string, after: :email
  end
end
