require "application_system_test_case"

class PerfisTest < ApplicationSystemTestCase
  setup do
    @perfil = perfis(:one)
  end

  test "visiting the index" do
    visit perfis_url
    assert_selector "h1", text: "Perfis"
  end

  test "creating a Perfil" do
    visit perfis_url
    click_on "New Perfil"

    fill_in "Celular", with: @perfil.celular
    fill_in "Cpf", with: @perfil.cpf
    fill_in "Data Nascimento", with: @perfil.data_nascimento
    fill_in "Nome", with: @perfil.nome
    fill_in "Sobrenome", with: @perfil.sobrenome
    fill_in "Tipo", with: @perfil.tipo
    fill_in "Usuario", with: @perfil.usuario_id
    click_on "Create Perfil"

    assert_text "Perfil was successfully created"
    click_on "Back"
  end

  test "updating a Perfil" do
    visit perfis_url
    click_on "Edit", match: :first

    fill_in "Celular", with: @perfil.celular
    fill_in "Cpf", with: @perfil.cpf
    fill_in "Data Nascimento", with: @perfil.data_nascimento
    fill_in "Nome", with: @perfil.nome
    fill_in "Sobrenome", with: @perfil.sobrenome
    fill_in "Tipo", with: @perfil.tipo
    fill_in "Usuario", with: @perfil.usuario_id
    click_on "Update Perfil"

    assert_text "Perfil was successfully updated"
    click_on "Back"
  end

  test "destroying a Perfil" do
    visit perfis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Perfil was successfully destroyed"
  end
end
