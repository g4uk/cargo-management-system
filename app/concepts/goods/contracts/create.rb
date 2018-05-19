module Good::Contract
  class Create < Reform::Form
    properties :name, :weight, :volume, :goods_type, :customer_id

    validates :name, :goods_type, presence: true
    validates :weight, :volume, presence: true
    validates :customer_id, presence: true
  end
end
