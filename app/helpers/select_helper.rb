module SelectHelper
  def driver_select
    Driver.all.map { |driver| [driver.info, driver.id] }
  end

  def company_select
    if current_company_owner
      current_company_owner.companies.pluck(:name, :id)
    else
      Company.pluck(:name, :id)
    end
  end

  def company_owner_select
    CompanyOwner.all.map { |owner| [owner.info, owner.id] }
  end

  def customer_select
    Customer.all.map { |customer| [customer.info, customer.id] }
  end

  def goods_select
    if current_customer
      current_customer.goods.map { |good| [good.info, good.id] }
    else
      Good.all.map { |good| [good.info, good.id] }
    end
  end

  def truck_select(company)
    company.trucks.pluck(:reg_number, :id)
  end
end
