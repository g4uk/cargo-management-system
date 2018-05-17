class Trailer::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Policy::Pundit(TrailerPolicy, :create)
    step Model(Trailer, :new)
    step Contract::Build(constant: Trailer::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :trailer)
  step Contract::Persist()
end
