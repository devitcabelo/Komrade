require "application_system_test_case"

class ProdutosTest < ApplicationSystemTestCase
  setup do
    @produto = produtos(:one)
  end

  test "visiting the index" do
    visit produtos_url
    assert_selector "h1", text: "Produtos"
  end

  test "creating a Produto" do
    visit produtos_url
    click_on "New Produto"

    fill_in "Data Lancamento", with: @produto.data_lancamento
    fill_in "Descricao", with: @produto.descricao
    fill_in "Estudio", with: @produto.estudio
    fill_in "Genero", with: @produto.genero
    fill_in "Idade Recomendada", with: @produto.idade_recomendada
    fill_in "Nome", with: @produto.nome
    fill_in "Nota", with: @produto.nota
    fill_in "Plataforma", with: @produto.plataforma
    fill_in "Resolucao Maxima", with: @produto.resolucao_maxima
    fill_in "Tipo", with: @produto.tipo
    fill_in "Valor Locacao", with: @produto.valor_locacao
    click_on "Create Produto"

    assert_text "Produto was successfully created"
    click_on "Back"
  end

  test "updating a Produto" do
    visit produtos_url
    click_on "Edit", match: :first

    fill_in "Data Lancamento", with: @produto.data_lancamento
    fill_in "Descricao", with: @produto.descricao
    fill_in "Estudio", with: @produto.estudio
    fill_in "Genero", with: @produto.genero
    fill_in "Idade Recomendada", with: @produto.idade_recomendada
    fill_in "Nome", with: @produto.nome
    fill_in "Nota", with: @produto.nota
    fill_in "Plataforma", with: @produto.plataforma
    fill_in "Resolucao Maxima", with: @produto.resolucao_maxima
    fill_in "Tipo", with: @produto.tipo
    fill_in "Valor Locacao", with: @produto.valor_locacao
    click_on "Update Produto"

    assert_text "Produto was successfully updated"
    click_on "Back"
  end

  test "destroying a Produto" do
    visit produtos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produto was successfully destroyed"
  end
end
