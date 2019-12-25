require 'rails_helper'

RSpec.describe 'Films', type: :system do
  before do
    @right_holder = FactoryBot.create(:right_holder, name: '高田', email: 'takada@gmail.com', password: 'takadada')
    @film = FactoryBot.create(:film, title: '映画a', intro: 'イントロダクション', production_year: '1998', right_holder: @right_holder)

    FactoryBot.create(:film, title: 'カーチェイス', intro: 'イントロダクション'*2, production_year: '1998', right_holder: @right_holder)
    FactoryBot.create(:film, title: 'ラブコメ', intro: 'イントロダクション'*2, director: '武田カイト', production_year: '2010', production_country: 'america', genre: 'ドラマ', right_holder: @right_holder)
    FactoryBot.create(:film, title: 'サスペンス', intro: 'イントロダクション'*2, director: '武田カイト', production_year: '1990', production_country: 'america', genre: 'スリラー', right_holder: @right_holder)
    FactoryBot.create(:film, title: 'SF', intro: 'イントロダクション', director: 'tunetomee', production_year: '2004', production_country: 'mexico', genre: 'ミステリー', right_holder: @right_holder)
    FactoryBot.create(:film, title: 'バイオレンス', intro: 'イントロダクション', director: 'tunetomee', production_year: '1978', production_country: 'mexico', genre: 'ドキュメンタリー', right_holder: @right_holder)
    FactoryBot.create(:film, title: '時代劇', intro: 'イントロダクション', director: '川島圭吾', production_year: '1955', production_country: '日本', genre: 'ドラマ', right_holder: @right_holder)
  end

  describe '映画一覧画面' do
    context '高田がログイン中に映画を登録した場合' do
      before do
        visit root_path
        click_link 'right_holder_entrance'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end

      it '映画一覧に遷移する' do
    # User編集画面を開く
        click_link '映画を登録'
        fill_in 'タイトル', with: '映画a'
        fill_in '製作年', with: '1998'
        fill_in '解説', with: 'イントロダクション'
        click_button '登録する'
        expect(page).to have_content '作品を登録しました'
      end
    end
  end

end
