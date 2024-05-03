# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_03_164640) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coroas", force: :cascade do |t|
    t.string "codigo"
    t.string "descricao"
    t.integer "preco_em_centavos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entregas", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagamentos", force: :cascade do |t|
    t.string "status"
    t.string "tipo"
    t.integer "parcelas"
    t.integer "valor_em_centavos"
    t.string "identificador"
    t.string "card_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "nome_falecido"
    t.date "data_velorio"
    t.date "hora_velorio"
    t.string "faixa"
    t.bigint "coroa_id", null: false
    t.bigint "velorio_id", null: false
    t.bigint "pagamento_id", null: false
    t.bigint "entrega_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coroa_id"], name: "index_pedidos_on_coroa_id"
    t.index ["entrega_id"], name: "index_pedidos_on_entrega_id"
    t.index ["pagamento_id"], name: "index_pedidos_on_pagamento_id"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
    t.index ["velorio_id"], name: "index_pedidos_on_velorio_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_completo"
    t.string "telefone"
    t.string "cpf"
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "velorios", force: :cascade do |t|
    t.string "nome"
    t.string "cidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pedidos", "coroas"
  add_foreign_key "pedidos", "entregas"
  add_foreign_key "pedidos", "pagamentos"
  add_foreign_key "pedidos", "users"
  add_foreign_key "pedidos", "velorios"
end
