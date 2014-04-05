class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :domain
      t.string :ability

      t.timestamps
    end
  end
end
