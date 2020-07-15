class CreateJoinTablePartiesSupplies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :parties, :supplies do |t|
      t.references :party
      t.references :supply
    end
  end
end
