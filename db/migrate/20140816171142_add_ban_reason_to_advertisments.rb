class AddBanReasonToAdvertisments < ActiveRecord::Migration
  def change
    add_column :advertisments, :ban_reason, :string
  end
end
