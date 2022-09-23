require 'rails_helper'

RSpec.describe "Teams", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @team = FactoryBot.build(:team)
  end

  context 'チーム登録ができるとき'do
    it 'ログインしたユーザーはチーム新規登録できる' do
      # ログインする
      visit new_user_session_path
      fill_in '名前', with: @user.name
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規班作成ページへのボタンがあることを確認する
      expect(page).to have_content('新規班作成')
      # 作成ページへ移動する
      visit new_team_path
      # フォームに情報を入力する
      fill_in 'team_team_name', with: @team.team_name
      fill_in 'team_affiliation', with: @team.affiliation
      choose '稼働中'
      # 送信するとTeamモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Team.count }.by(1)
      # 班一覧ページに遷移する
      expect(current_path).to eq(teams_path)
      # 班一覧ページには先ほど作成した班が存在することを確認する
      expect(page).to have_content(@team_team_name)
    end
  end
  context 'チーム登録ができないとき'do
    it 'ログインしていないと新規登録ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('新規班作成')
    end
  end
end
