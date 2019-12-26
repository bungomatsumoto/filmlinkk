require 'rails_helper'

RSpec.describe 'Films', type: :system do
  before do
    @right_holder = FactoryBot.create(
      :right_holder,
      name: '高田',
      email: 'takada@gmail.com',
      password: 'takadada',
      confirmation_token: @token,
      confirmed_at: Time.now )
    @film = FactoryBot.create(:film, title: '映画a', intro: 'イントロダクション', production_year: 1998, right_holder: @right_holder)

    FactoryBot.create(:film, title: 'カーチェイス', intro: 'イントロダクション'*2, production_year: 1998, right_holder: @right_holder)
    FactoryBot.create(:film, title: 'ラブコメ', intro: 'イントロダクション'*2, director: '武田カイト', production_year: 2010, production_country: 'america', genre: 'ドラマ', right_holder: @right_holder)
    FactoryBot.create(:film, title: 'サスペンス', intro: 'イントロダクション'*2, director: '武田カイト', production_year: 1990, production_country: 'america', genre: 'スリラー', right_holder: @right_holder)
    FactoryBot.create(:film, title: 'SF', intro: 'イントロダクション', director: 'tunetomee', production_year: 2004, production_country: 'mexico', genre: 'ミステリー', right_holder: @right_holder)
    FactoryBot.create(:film, title: 'バイオレンス', intro: 'イントロダクション', director: 'tunetomee', production_year: 1978, production_country: 'mexico', genre: 'ドキュメンタリー', right_holder: @right_holder)
    FactoryBot.create(:film, title: '時代劇', intro: 'イントロダクション', director: '川島圭吾', production_year: 1955, production_country: '日本', genre: 'ドラマ', right_holder: @right_holder)
  end

  describe '映画一覧画面' do
    context '高田がログイン中に映画を登録した場合' do
      before do
        visit root_path
        click_link 'right_holder_login'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end

      it '映画一覧に遷移する' do
        click_link '映画を登録'
        fill_in 'タイトル', with: '映画a'
        fill_in '製作年', with: '1998'
        fill_in '解説', with: 'イントロダクション'
        click_button '登録する'
        expect(page).to have_content '作品を登録しました'
      end
    end
  end

  describe '映画登録画面' do
    context '高田が必要項目を入力して、createボタンを押した場合' do
      before do
        visit root_path
        click_link 'right_holder_login'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end

      it 'データが保存されること' do
        visit new_film_path
        fill_in 'タイトル', with: 'タスク'
        fill_in '製作年', with: '1998'
        fill_in '解説', with: 'ファンクション'
        click_button '登録する'
        expect(page).to have_content 'タスク', 'ファンクション'
      end
    end
  end

  describe '映画詳細画面' do
    context '高田が任意の映画詳細画面に遷移した場合' do
      before do
        visit root_path
        click_link 'right_holder_login'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end

      it '該当映画の内容が表示されたページに遷移すること' do
        visit film_path(@film)
        expect(page).to have_content '映画a','イントロダクション'
      end
    end
  end

  describe '映画一覧画面' do
    context '高田が製作国並び替えリンクをクリックした場合' do
      before do
        visit root_path
        click_link 'right_holder_login'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end
      sleep 2
      it '映画が製作国の降順で並ぶこと' do
        click_link '製作国'
        sleep 1
        expect(all('tbody tr').last).to have_content '日本'
      end
    end
  end

  describe '映画一覧画面' do
    context '高田がキーワード検索した場合' do
      before do
        visit root_path
        click_link 'right_holder_login'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end
      sleep 2
      it '検索ワードを含んだ映画のみが並ぶこと' do
        fill_in 'キーワード', with: 'tunetomee'
        click_button '検索'
        sleep 1
        expect(page).to have_content 'SF', 'バイオレンス'
      end
    end
  end

  describe '映画一覧画面' do
    context '高田が製作年検索した場合' do
      before do
        visit root_path
        click_link 'right_holder_login'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end
      sleep 2
      it '該当する製作年の映画のみが並ぶこと' do
        fill_in 'q_production_year_gteq', with: '2006'
        click_button '検索'
        sleep 1
        expect(find("#film_title")).to have_content 'ラブコメ'
      end
    end
  end
end
