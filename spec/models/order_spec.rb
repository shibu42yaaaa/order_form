require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#totla_price' do
    let(:params) do
      {
        order_products_attributes: [
          {
            product_id: 1,
            quantity: 1,
          }
        ]
      }
    end

    subject { Order.new(params).total_price }

    it { is_expected.to eq 400 + 40 }
    
    # テスト用にデータを作成する
    context '消費税に端数が出た場合' do
      before do
        create(:product, id:99, price: 299 )
      end
      let(:params) do
        {
          order_products_attributes: [
            {
              product_id: 99,
              quantity: 1,
            }
          ]
        }
      end
      # お値段 299 消費税 29.9 切り上げ = 30
      it { is_expected.to eq 329 }
    end
  end


  describe "#valid?" do
    let(:name) {'サンプルマン'}
    let(:email) {'sample@example.com'}
    let(:telephone) {'031112222'}
    let(:delivery_address) {'葛飾区亀有公園前派出所'}
    let(:payment_method_id) { 1 }
    let(:other_comment) { 'ワシのプラモだ' }
    let(:direct_mail_enabled) { true }
    let(:params) do
      {
        name:,
        email:,
        telephone:,
        delivery_address:,
        payment_method_id:,
        other_comment:,
        direct_mail_enabled:
      }
    end

    subject { Order.new(params).valid? }

    it { is_expected.to eq true }
    
    # 異常系テスト
    context '名前が空白の場合' do
      let(:name) {''}

      it { is_expected.to eq false }
    end
    context 'メールアドレスが空白の場合' do
      let(:email) {''}

      it { is_expected.to eq false }
    end
    context 'メールアドレスの書式が正しくない場合' do
      let(:email) {'testtesttest.com'}

      it { is_expected.to eq false }
    end
    context 'メールアドレスが全角の場合' do
      let(:email) {'ｆａｊｇａｇｊ＠ａｖｋ．ｃｏｍ'}

      it { is_expected.to eq true }
    end

    context '電話番号が空白の場合' do
      let(:telephone) {''}

      it { is_expected.to eq false }
    end
    context '電話番号が全角の場合' do
      let(:telephone) {'０８０３３３３４４４４'}

      it { is_expected.to eq true }
    end
    context '電話番号に数字以外が入っている場合' do
      let(:telephone) {'080-1111-4444'}

      it { is_expected.to eq true }
    end
    context '電話番号が12桁の場合' do
      let(:telephone) {'080111144441'}

      it { is_expected.to eq false }
    end


    context 'お届け先住所が空白の場合' do
      let(:delivery_address) {''}

      it { is_expected.to eq false }
    end

    context '支払い方法が未入力の場合' do
      let(:payment_method_id) { nil }

      it { is_expected.to eq false }
    end

    context 'その他・ご要望欄が空白の場合' do
      let(:other_comment) { '' }

      it { is_expected.to eq true }
    end
    
    context 'その他・ご要望欄の文字数が1000文字の場合' do
      let(:other_comment) { 'あ' * 1_000 }

      it { is_expected.to eq true }
    end

    context 'その他・ご要望欄の文字数が1001文字以上の場合' do
      let(:other_comment) { 'あ' * 1_001 }

      it { is_expected.to eq false }
    end

    context 'メールマガジンの配信要否が未選択の場合' do
      let(:direct_mail_enabled) { nil }

      it { is_expected.to eq false }
    end
  end
end
