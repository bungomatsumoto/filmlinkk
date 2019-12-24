require 'rails_helper'

RSpec.describe 'Films', type: :system do
  before do
    @film = Film.create!(title: 'いとう')
  end

  # it 'completes yubinbango automatically with JS' do
  #   # User編集画面を開く
  #   visit edit_user_path(@user)

  #   # Nameに"いとう"が入力されていることを検証する
  #   expect(page).to have_content 'いとう'
  # end

end
