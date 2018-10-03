require "application_system_test_case"

class CarrinhosTest < ApplicationSystemTestCase
  setup do
    @carrinho = carrinhos(:one)
  end

  test "visiting the index" do
    visit carrinhos_url
    assert_selector "h1", text: "Carrinhos"
  end

  test "creating a Carrinho" do
    visit carrinhos_url
    click_on "New Carrinho"

    fill_in "Itens", with: @carrinho.itens_id
    fill_in "Total", with: @carrinho.total
    click_on "Create Carrinho"

    assert_text "Carrinho was successfully created"
    click_on "Back"
  end

  test "updating a Carrinho" do
    visit carrinhos_url
    click_on "Edit", match: :first

    fill_in "Itens", with: @carrinho.itens_id
    fill_in "Total", with: @carrinho.total
    click_on "Update Carrinho"

    assert_text "Carrinho was successfully updated"
    click_on "Back"
  end

  test "destroying a Carrinho" do
    visit carrinhos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carrinho was successfully destroyed"
  end
end
