module Good::Contract
  class Create < Reform::Form
    properties :name, :weight, :volume, :goods_type, :customer_id

    validates :name, :good_type, presence: true
    validates :weight, :volume, numericality: { greater_than: 0 }
    validates :customer_id, presence: true,  inclusion: { in: ->(*) { Customer.pluck(:id).map(&:to_s) } }
  end
end
