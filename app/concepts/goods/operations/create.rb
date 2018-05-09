class Good::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Good, :new)
    step Contract::Build(constant: Good::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :good)
  step Contract::Persist()
end
