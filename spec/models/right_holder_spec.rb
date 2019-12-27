require 'rails_helper'

RSpec.describe RightHolder, type: :model do

  it "nameが空ならバリデーションが通らない" do
    right_holder = RightHolder.new(name: '', intro: '失敗テスト')
    expect(right_holder).not_to be_valid
  end

  it "emailのlengthが51以上だとバリデーションが通らない" do
    right_holder = RightHolder.new(name: 'ccc', email: '12345678901234567890123456789012345678901234567890@gmail.com')
    expect(right_holder).not_to be_valid
  end

  it "nameが重複しているとバリデーションが通らない" do
    right_holder = RightHolder.new(name: 'ccc', intro: '失敗テスト')
    @right_holder = RightHolder.new(name: 'ccc', intro: 'テスト')
    @right_holder.valid?
    expect(@right_holder.valid?).to eq(false)
  end
end
