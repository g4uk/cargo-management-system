module CompanyOwner::Contract
  class Create < Reform::Form
    properties :first_name, :last_name, :email, :phone, :password
    property :password_confirmation, virtual: true
  end
end
