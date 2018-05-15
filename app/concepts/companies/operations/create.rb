class Company::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Company, :new)
    step Policy::Pundit(CompanyPolicy, :create)
    success :set_company_owner
    step Contract::Build(constant: Company::Contract::Create)

    def set_company_owner(options, current_user:, **)
      options[:model].company_owner_id = current_user.id if current_user.class == CompanyOwner
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :company)
  step Contract::Persist()
end
