module Customer::Contract
  class Create < Reform::Form
    properties :first_name, :last_name, :email, :mobile_phone, :company_phone, :password
    property :password_confirmation, virtual: true
  end
end
