class CreateJoinTableOrigin < ActiveRecord::Migration[5.0]
  def change
    create_join_table :origins, :leads do |t|
      # t.index [:origin_id, :lead_id]
      # t.index [:lead_id, :origin_id]
    end
  end
end
