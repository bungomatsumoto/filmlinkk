require 'rails_helper'

RSpec.describe 'Clients', type: :system do
  before do
    @right_holder1 = FactoryBot.create(
      :right_holder,
      name: '高田',
      email: 'takada@gmail.com',
      password: 'takadada',
      confirmation_token: @token,
      confirmed_at: Time.now )
    @right_holder2 = FactoryBot.create(
      :right_holder,
      name: 'wada',
      email: 'wada@gmail.com',
      password: 'wadada',
      confirmation_token: @token,
      confirmed_at: Time.now )
    @film = FactoryBot.create(:film, title: '映画a', intro: 'イントロダクション', production_year: 1998, right_holder: @right_holder1)
    @client = FactoryBot.create(
      :client,
      name: '田沢',
      screen_name: 'アップリンク',
      country: '日本',
      email: 'tazawa@gmail.com',
      password: 'tazawada',
      confirmation_token: @token,
      confirmed_at: Time.now )

    FactoryBot.create(
      :client,
      name: '佐藤',
      screen_name: 'ユーロスペース',
      country: '日本',
      email: 'satou@gmail.com',
      password: 'satouda',
      confirmation_token: @token,
      confirmed_at: Time.now )

    FactoryBot.create(
      :client,
      name: '吉田',
      screen_name: '台北',
      country: '台湾',
      email: 'yoshida@gmail.com',
      password: 'yoshidada',
      confirmation_token: @token,
      confirmed_at: Time.now )

    FactoryBot.create(
      :client,
      name: 'Bob',
      screen_name: 'cinemavierra',
      country: 'france',
      email: 'bob@gmail.com',
      password: 'bobbob',
      confirmation_token: @token,
      confirmed_at: Time.now )

    FactoryBot.create(
      :client,
      name: 'Nina',
      screen_name: 'Simone',
      country: 'america',
      email: 'nina@gmail.com',
      password: 'ninanina',
      confirmation_token: @token,
      confirmed_at: Time.now )
  end

  describe '映画一覧画面' do
    context '田沢がログイン中に映画の上映権を得た場合' do
      before do
        visit root_path
        click_link 'client_login'
        fill_in 'メールアドレス', with: 'tazawa@gmail.com'
        fill_in 'パスワード', with: 'tazawada'
        click_button 'ログイン'
      end

      it '上映権を持っていることが明示される' do
        visit film_path(@film)
        sleep 1
        find('.booking_link').click
        expect(page).to have_content '上映権を持つことを明らかにします'
      end
    end
  end

  describe '興行主一覧画面' do
    context '田沢がログイン中に自身の詳細画面を訪れた場合' do
      before do
        visit root_path
        click_link 'client_login'
        fill_in 'メールアドレス', with: 'tazawa@gmail.com'
        fill_in 'パスワード', with: 'tazawada'
        click_button 'ログイン'
      end

      it '自身の情報を編集できる' do
        visit clients_path
        visit client_path(@client)
        click_link '上記の内容を編集'
        fill_in 'client_screen_name', with: 'O-EAST'
        fill_in 'client_current_password', with: 'tazawada'
        click_button '更新'
        expect(page).to have_content 'O-EAST'
      end
    end
  end

  describe '興行主一覧画面' do
    context '田沢がログイン中にキーワード検索した場合' do
      before do
        visit root_path
        click_link 'client_login'
        fill_in 'メールアドレス', with: 'tazawa@gmail.com'
        fill_in 'パスワード', with: 'tazawada'
        click_button 'ログイン'
      end

      it '検索ワードを含んだ興行主のみが並ぶこと' do
        visit clients_path
        fill_in 'キーワード', with: 'Bob'
        click_button '検索'
        sleep 1
        expect(all('tbody tr')[1]).to have_content 'Bob'
      end
    end
  end

end
