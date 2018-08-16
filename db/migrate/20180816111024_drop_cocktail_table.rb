class DropCocktailTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :cocktails
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
