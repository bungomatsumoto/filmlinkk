require 'rails_helper'

RSpec.describe Film, type: :model do

  # before do
  #   @right_holder = create(:right_holder)
  # end

  it "titleが空ならバリデーションが通らない" do
    film = Film.new(title: '', intro: '失敗テスト')
    expect(film).not_to be_valid
  end

  it "production_yearがintegerでなければバリデーションが通らない" do
    film = Film.new(title: '映画', intro: '失敗テスト', production_year: 'aaa')
    expect(film).not_to be_valid
  end

  it "introのlengthが501以上だとバリデーションが通らない" do
    film = Film.new(title: '映画', intro: '失敗テスト'*101, production_year: 'aaa')
    expect(film).not_to be_valid
  end

  it "titleがありintroが500以内でyearがintegerならバリデーションが通る" do
    # @right_holder = create(:right_holder)
    film = Film.new(
      title: '映画',
      intro: '失敗テスト',
      production_year: 1999)
    expect(film).to be_valid
  end

end
