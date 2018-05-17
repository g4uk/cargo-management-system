class Trailer::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Trailer, :find)
    step Policy::Pundit(TrailerPolicy, :update)
    step Contract::Build(constant: Trailer::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :trailer)
  step Contract::Persist()
end
