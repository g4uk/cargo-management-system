module Order::Contract
  class Create < Reform::Form
    properties :cost, :downloading_address, :unloading_address, :status, :customer_id, :driver_id
    property :goods_ids, virtual: true

    validates :downloading_address, :unloading_address, :goods_ids, presence: true
    validates :cost, numericality: { greater_than: 0}
    validates :customer_id, presence: true
  end
end
