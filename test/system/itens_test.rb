require "application_system_test_case"

class ItensTest < ApplicationSystemTestCase
  setup do
    @item = itens(:one)
  end

  test "visiting the index" do
    visit itens_url
    assert_selector "h1", text: "Itens"
  end

  test "creating a Item" do
    visit itens_url
    click_on "New Item"

    fill_in "Alugado", with: @item.alugado
    fill_in "Codigo", with: @item.codigo
    fill_in "Produto", with: @item.produto_id
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit itens_url
    click_on "Edit", match: :first

    fill_in "Alugado", with: @item.alugado
    fill_in "Codigo", with: @item.codigo
    fill_in "Produto", with: @item.produto_id
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit itens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
