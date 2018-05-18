module User
  def current_user
    [current_driver, current_admin, current_company_owner, current_customer].each do |user|
      return user if user
    end
    nil
  end
end
