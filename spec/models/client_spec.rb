require 'rails_helper'

RSpec.describe Client, type: :model do

  it "nameが空ならバリデーションが通らない" do
    client = Client.new(name: '', intro: '失敗テスト')
    expect(client).not_to be_valid
  end

  it "emailのlengthが51以上だとバリデーションが通らない" do
    client = Client.new(name: 'ccc', email: '12345678901234567890123456789012345678901234567890@gmail.com')
    expect(client).not_to be_valid
  end

  it "nameが重複しているとバリデーションが通らない" do
    client = Client.new(name: 'ccc', intro: '失敗テスト')
    @client = Client.new(name: 'ccc', intro: 'テスト')
    @client.valid?
    expect(@client.valid?).to eq(false)
  end

end
