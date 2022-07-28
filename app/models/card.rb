class Card < ApplicationRecord
	belongs_to :user
	has_many :billings

	enum card_type: [ :debit, :credit ]

	def self.to_csv(fields = column_names, options = {})
		CSV.generate(options) do |csv|
			csv << fields
			all.each do |card|
				csv << card.attributes.values_at(*fields)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			card_hash = row.to_hash
			card = create(card_holder_name: card_hash['card_holder_name'], card_number: card_hash['card_number'], cvv_number: card_hash['cvv_number'], valid_from: card_hash['valid_from'], valid_upto: card_hash['valid_upto'], user_id: card_hash['user_id'], card_type: card_hash['card_type'], bank_name: card_hash['bank_name'])			
		end
	end
end
