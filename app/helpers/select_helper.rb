module SelectHelper
  def driver_select
    if current_company_owner
      Driver.where(company_id: current_company_owner.companies.ids).order(first_name: :asc).map { |driver| [driver.info, driver.id] }
    else
      Driver.all.order(first_name: :asc).map { |driver| [driver.info, driver.id] }
    end
  end

  def company_select
    if current_company_owner
      current_company_owner.companies.order(brand: :asc).pluck(:name, :id).order(name: :asc)
    else
      Company.order(first_name: :asc).pluck(:name, :id)
    end
  end

  def company_owner_select
    CompanyOwner.all.order(first_name: :asc).map { |owner| [owner.info, owner.id] }
  end

  def customer_select
    Customer.all.order(first_name: :asc).map { |customer| [customer.info, customer.id] }
  end

  def goods_select
    if current_customer
      current_customer.goods.map { |good| [good.info, good.id] }
    else
      Good.all.order(name: :asc).map { |good| [good.info, good.id] }
    end
  end

  def truck_select(company)
    company.trucks.order(brand: :asc).pluck(:reg_number, :id)
  end
end
