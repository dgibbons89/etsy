class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :coupon, :string
  	add_column :users, :extra_access, :boolean, :default => false
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :stripe_card_token, :string
    add_column :users, :plan, :string
    add_column :users, :customer_id, :string
    add_column :users, :last_4_digits, :string
    add_column :users, :amount, :decimal
  end
end
