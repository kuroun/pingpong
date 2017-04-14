module ControllerMacros

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create(:email => 'top_geek1@gmail.com',:password => '12345678', :score => 0)
      sign_in user
    end
  end
end