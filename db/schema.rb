# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_16_143109) do

  create_table "carrinho_produtos", force: :cascade do |t|
    t.integer "carrinho_id"
    t.integer "produto_id"
    t.date "data_inicio"
    t.date "data_fim"
    t.integer "quantidade"
    t.index ["carrinho_id"], name: "index_carrinho_produtos_on_carrinho_id"
    t.index ["produto_id"], name: "index_carrinho_produtos_on_produto_id"
  end

  create_table "carrinhos", force: :cascade do |t|
    t.integer "total_cents", default: 0, null: false
    t.string "total_currency", default: "BRL", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "estado"
    t.string "cidade"
    t.string "bairro"
    t.string "logradouro"
    t.string "complemento"
    t.string "numero"
    t.string "responsavel"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_enderecos_on_perfil_id"
  end

  create_table "favoritos", force: :cascade do |t|
    t.integer "perfil_id"
    t.integer "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_favoritos_on_perfil_id"
    t.index ["produto_id"], name: "index_favoritos_on_produto_id"
  end

  create_table "item_pedidos", force: :cascade do |t|
    t.integer "item_id"
    t.integer "pedido_id"
    t.date "data_inicio"
    t.date "data_fim"
    t.index ["item_id"], name: "index_item_pedidos_on_item_id"
    t.index ["pedido_id"], name: "index_item_pedidos_on_pedido_id"
  end

  create_table "itens", force: :cascade do |t|
    t.integer "produto_id"
    t.string "codigo"
    t.boolean "alugado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_itens_on_produto_id"
  end

  create_table "lista_desejos", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_lista_desejos_on_perfil_id"
    t.index ["produto_id"], name: "index_lista_desejos_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "total_cents", default: 0, null: false
    t.string "total_currency", default: "BRL", null: false
    t.integer "forma_pagamento"
    t.datetime "data"
    t.integer "endereco_id"
    t.integer "perfil_id"
    t.index ["endereco_id"], name: "index_pedidos_on_endereco_id"
    t.index ["perfil_id"], name: "index_pedidos_on_perfil_id"
  end

  create_table "perfis", force: :cascade do |t|
    t.integer "usuario_id"
    t.string "nome"
    t.string "sobrenome"
    t.string "cpf"
    t.string "celular"
    t.string "data_nascimento"
    t.integer "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_perfis_on_usuario_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "valor_locacao_cents", default: 0, null: false
    t.string "valor_locacao_currency", default: "BRL", null: false
    t.float "nota"
    t.string "plataforma"
    t.string "genero"
    t.string "estudio"
    t.integer "idade_recomendada"
    t.date "data_lancamento"
    t.string "resolucao_maxima"
    t.integer "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recomendacoes", force: :cascade do |t|
    t.integer "perfil_id"
    t.string "recomendacoes", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_recomendacoes_on_perfil_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
