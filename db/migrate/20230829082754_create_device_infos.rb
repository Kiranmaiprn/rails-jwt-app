class CreateDeviceInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :device_infos do |t|
      t.string :token
      t.string :device_type
      t.references :user,index: true, foriegn_key: true
      
      t.timestamps
    end
  end
end
