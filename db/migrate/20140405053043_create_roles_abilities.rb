class CreateRolesAbilities < ActiveRecord::Migration
  def change
    create_table :roles_abilities do |t|
      t.integer :role_id
      t.integer :ability_id

      t.timestamps
    end

    add_index :roles_abilities, :role_id
    add_index :roles_abilities, :ability_id
  end
end
