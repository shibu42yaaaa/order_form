require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#valid?" do
    let(:name) {'サンプルマン'}
    let(:email) {'sample@example.com'}
    let(:telephone) {'031112222'}
    let(:delivery_address) {'葛飾区亀有公園前派出所'}
    let(:params) do
      {
        name:,
        email:,
        telephone:,
        delivery_address:
      }
    end

    it '返り値はtrueとなること' do
      order = Order.new(params)
      expect(order.valid?).to eq true
    end

    context '名前が空白の場合' do
      it '返り値はfalseとなること' do
        order = Order.new(params)
        expect(order.valid?).to eq false
      end
    end
  end
end
