module Trailer::Contract
  class Create < Reform::Form
    properties :name, :address, :email, :phone
  end
end
