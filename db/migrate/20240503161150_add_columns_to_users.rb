class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nome_completo, :string
    add_column :users, :telefone, :string
    add_column :users, :cpf, :string
    add_column :users, :cep, :string
    add_column :users, :logradouro, :string
    add_column :users, :numero, :string
    add_column :users, :complemento, :string
    add_column :users, :bairro, :string
    add_column :users, :cidade, :string
    add_column :users, :estado, :string
  end
end
