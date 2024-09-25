module AuthenticationHelper
  def login_as(user)
    visit login_path
    page.set_rack_session(user_id: user.id)
    page.refresh
  end
end
