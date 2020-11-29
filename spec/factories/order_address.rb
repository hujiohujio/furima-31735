FactoryBot.define do
  factory :order_address do
    postal_code { '000-0000' } 
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '横浜市' }
    house_number { '1-1' }
    phone { '00000000000' }
    token { "tok_abcdefghijk00000000000000000" }
  end
  
end





