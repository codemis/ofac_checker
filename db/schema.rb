ActiveRecord::Schema.define :version => 0 do
	# create the table, if it does not exist
	#
	unless table_exists?(:ofac_sdns)
		create_table :ofac_sdns do |t|
			t.text      :name
			t.string    :sdn_type
			t.string    :program
			t.string    :title
			t.string    :vessel_call_sign
			t.string    :vessel_type
			t.string    :vessel_tonnage
			t.string    :gross_registered_tonnage
			t.string    :vessel_flag
			t.string    :vessel_owner
			t.text      :remarks
			t.text      :address
			t.string    :city
			t.string    :country
			t.string    :address_remarks
			t.string    :alternate_identity_type
			t.text      :alternate_identity_name
			t.string    :alternate_identity_remarks
			t.timestamps
		end
		add_index :ofac_sdns, :sdn_type
	end
 end