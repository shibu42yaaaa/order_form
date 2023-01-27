FactoryBot.define do
  factory :order do
    name {'サンプルマン'}
    email { 'sample@example.com' }
    telephone { '09011112222'}
    delivery_address { '東京都葛飾区亀有公園前派出所'}
    payment_method_id { 1 }
    other_comment { 'テスト用コメント' }
    direct_mail_enabled { true }
  end
end
