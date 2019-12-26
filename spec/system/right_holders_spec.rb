require 'rails_helper'

RSpec.describe 'Clients', type: :system do
  before do
    @right_holder = FactoryBot.create(
      :right_holder,
      name: '高田',
      email: 'takada@gmail.com',
      password: 'takadada',
      confirmation_token: @token,
      confirmed_at: Time.now )

    @film = FactoryBot.create(:film,
      title: '映画a',
      intro: 'イントロダクション',
      production_year: 1998,
      right_holder: @right_holder)

    @film1 = FactoryBot.create(:film,
      title: '映画b',
      intro: 'イントロダクション',
      production_year: 2001,
      right_holder: @right_holder)

    @film2 = FactoryBot.create(:film,
      title: '映画c',
      intro: 'イントロダクション',
      production_year: 1980,
      right_holder: @right_holder)

    @client = FactoryBot.create(
      :client,
      name: '田沢',
      screen_name: 'アップリンク',
      country: '日本',
      email: 'tazawa@gmail.com',
      password: 'tazawada',
      confirmation_token: @token,
      confirmed_at: Time.now )

    @client2 = FactoryBot.create(
      :client,
      name: '戸田',
      screen_name: 'シネマロサ',
      country: '日本',
      email: 'toda@gmail.com',
      password: 'todada',
      confirmation_token: @token,
      confirmed_at: Time.now )
  end

  describe '映画一覧画面' do
    context '高田がログイン中に自身の詳細画面を訪れた場合' do
      before do
        visit root_path
        click_link 'right_holder_login'
        fill_in 'メールアドレス', with: 'takada@gmail.com'
        fill_in 'パスワード', with: 'takadada'
        click_button 'ログイン'
      end

      it '自身の情報を編集できる' do
        visit film_path(@film1)
        visit right_holder_path(@right_holder)
        visit edit_right_holder_registration_path(@right_holder)
        fill_in 'right_holder_intro', with: 'イントロダクション'
        fill_in 'right_holder_current_password', with: 'takadada'
        click_button '更新'
        expect(page).to have_content 'イントロダクション'
      end
    end
  end

end
