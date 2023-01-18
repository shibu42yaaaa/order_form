class AddTelephoneToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :telephone, :string, null: false, commnet: '電話番号'
  end
end
