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

  it "ransack使用時、該当titleが一つの場合に一つ表示" do
    film1 = Film.create(id: 1, title: 'MMM')
    film2 = Film.create(id: 2, title: 'GGG')
    film3 = Film.create(id: 3, title: 'QQQ')
    film4 = Film.create(id: 4, title: '55555')
    expect(Film.ransack("GGG")).to include("GGG")
  end

end
