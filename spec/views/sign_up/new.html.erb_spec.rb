require "rails_helper"

RSpec.describe "sign_up/new", type: :view do
  let (:user) { create(:user) }

  it "displays the sign up form" do
    assign(:new_user, user)
    
    render

    expect(rendered).to have_css("h1.has-text-centered", text: "Crea una cuenta")
    expect(rendered).to have_css("form.simple_form")
    expect(rendered).to have_content("Nombre")
    expect(rendered).to have_content("Correo electrónico")
    expect(rendered).to have_content("Contraseña")
    expect(rendered).to have_content("Confirmar constraseña")
  end
end
