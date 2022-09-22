require 'rails_helper'

RSpec.describe "Schedules", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @team = FactoryBot.build(:team)
    @team.work = 'true'
    @team.save
    @schedule = FactoryBot.create(:schedule)
  end

  context '新規予約登録ができるとき'do
    it 'ログインしたユーザーは新規予約登録できる' do
      # ログインする
      visit new_user_session_path
      fill_in '名前', with: @user.name
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規予約ページへのボタンがあることを確認する
      expect(page).to have_content('新規予約')
      # 予約ページへ移動する
      visit new_schedule_path
      # フォームに情報を入力する
      fill_in 'schedule[scheduled_date]', with: @schedule.scheduled_date
      select "午前", from: 'schedule[time_zone_id]'
      select "小", from: 'schedule[size_id]'
      select "仮予約", from: 'schedule[accuracy_id]'
      select "---", from: 'schedule[mie_id]'
      select "営業", from: 'schedule[first_contact_id]'
      # 送信するとScheduleモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Schedule.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq(root_path)
      # 先ほど作成した予約が存在することを確認する
      visit schedule_path(@schedule.id)
    end
  end
  context '新規予約登録ができないとき'do
    it 'ログインしていないと新規予約登録ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('新規予約')
    end
  end
end
