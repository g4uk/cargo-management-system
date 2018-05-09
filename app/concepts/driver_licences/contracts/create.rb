module DriverLicense::Contract
  class Create < Reform::Form
    properties :name, :address, :email, :phone
  end
end
