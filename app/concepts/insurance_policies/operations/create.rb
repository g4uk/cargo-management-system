class InsurancePolicy::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Policy::Pundit(InsurancePolicyPolicy, :create)
    step Model(InsurancePolicy, :new)
    success :set_driver
    step Contract::Build(constant: InsurancePolicy::Contract::Create)

    def set_driver(_options, model:, current_user:, **)
      model.driver_id = current_user.id if current_user.is_a?(Driver)
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :insurance_policy)
  step Contract::Persist()
end
