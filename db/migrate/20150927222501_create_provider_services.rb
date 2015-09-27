class CreateProviderServices < ActiveRecord::Migration
  def change
    create_table :provider_services do |t|
      t.references :service, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
