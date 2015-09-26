class CreateOutageReports < ActiveRecord::Migration
  def change
    create_table :outage_reports do |t|
      t.references :service, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.string :location
      t.text :address
      t.text :notes
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps null: false
    end
  end
end
