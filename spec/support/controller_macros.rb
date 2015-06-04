module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:admin_user)
      sign_in @user
      @ability = Ability.new(@user)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:regular_user)
      sign_in @user
      @ability = Ability.new(@user)
    end
  end
end