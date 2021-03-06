require 'test_helper'

class PerfisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perfil = perfis(:one)
  end

  test "should get index" do
    get perfis_url
    assert_response :success
  end

  test "should get new" do
    get new_perfil_url
    assert_response :success
  end

  test "should create perfil" do
    assert_difference('Perfil.count') do
      post perfis_url, params: { perfil: { celular: @perfil.celular, cpf: @perfil.cpf, data_nascimento: @perfil.data_nascimento, nome: @perfil.nome, sobrenome: @perfil.sobrenome, tipo: @perfil.tipo, usuario_id: @perfil.usuario_id } }
    end

    assert_redirected_to perfil_url(Perfil.last)
  end

  test "should show perfil" do
    get perfil_url(@perfil)
    assert_response :success
  end

  test "should get edit" do
    get edit_perfil_url(@perfil)
    assert_response :success
  end

  test "should update perfil" do
    patch perfil_url(@perfil), params: { perfil: { celular: @perfil.celular, cpf: @perfil.cpf, data_nascimento: @perfil.data_nascimento, nome: @perfil.nome, sobrenome: @perfil.sobrenome, tipo: @perfil.tipo, usuario_id: @perfil.usuario_id } }
    assert_redirected_to perfil_url(@perfil)
  end

  test "should destroy perfil" do
    assert_difference('Perfil.count', -1) do
      delete perfil_url(@perfil)
    end

    assert_redirected_to perfis_url
  end
end
