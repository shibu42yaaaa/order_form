class CreateOrderInflowSources < ActiveRecord::Migration[7.0]
  def change
    create_table :order_inflow_sources, commnet: '注文情報　注文者が選択した流入元' do |t|
      t.string :name
      t.references :order, null: false, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.references :inflow_source, null: false, foreign_key: { on_delete: :restrict, on_update: :restrict }

      t.timestamps
    end
  end
end
