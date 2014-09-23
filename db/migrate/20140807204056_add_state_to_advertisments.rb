class AddStateToAdvertisments < ActiveRecord::Migration
  def change
    add_column :advertisments, :state, :string, default: 'sketch'
  end
end
