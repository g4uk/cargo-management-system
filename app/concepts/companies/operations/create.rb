class Company::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Company, :new)
    step Policy::Pundit(CompanyPolicy, :create)
    step Contract::Build(constant: Company::Contract::Create)
    step :set_company_owner

    def set_company_owner(options, current_user:, **)
      options[:model].company_owner_id = current_user.id if current_user.class == CompanyOwner
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :company)
  step Contract::Persist()
end
