class Order::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Policy::Pundit(OrderPolicy, :create)
    step Model(Order, :new)
    step Contract::Build(constant: Order::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :order)
  step Contract::Persist()
  step :add_goods_to_order

  def add_goods_to_order(_options, model:, params:, **)
    params[:order][:goods_ids].delete('')
    params[:order][:goods_ids].map { |i| model.goods << Good.find(i) }
  end
end
