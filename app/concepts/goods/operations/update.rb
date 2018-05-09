class Good::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Good, :find)
    step Contract::Build(constant: Good::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :good)
  step Contract::Persist()
end
