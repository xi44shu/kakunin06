require 'rails_helper'

# RSpec.describe "Schedules", type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @team = FactoryBot.build(:team)
#     @team.work = 'true'
#     @team.save
#     @schedule = FactoryBot.build(:schedule)
#   end

#   context '新規予約登録ができるとき'do
#     it 'ログインしたユーザーは新規予約登録できる' do
#       # ログインする
#       visit new_user_session_path
#       fill_in '名前', with: @user.name
#       fill_in 'パスワード', with: @user.password
#       find('input[name="commit"]').click
#       expect(current_path).to eq(root_path)
#       # 新規予約ページへのリンクがあることを確認する
#       expect(page).to have_content('新規予約')
#       # 予約ページへ移動する
#       visit new_schedule_path
#       # フォームに情報を入力する
#       fill_in 'schedule[scheduled_date]', with: @schedule.scheduled_date
#       select "午前", from: 'schedule[time_zone_id]'
#       select "小", from: 'schedule[size_id]'
#       select "仮予約", from: 'schedule[accuracy_id]'
#       select "---", from: 'schedule[mie_id]'
#       select "営業", from: 'schedule[first_contact_id]'
#       # 送信するとScheduleモデルのカウントが1上がることを確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Schedule.count }.by(1)
#       # トップページに遷移する
#       expect(current_path).to eq(root_path)
#     end
#   end
#   context '新規予約登録ができないとき'do
#     it 'ログインしていないと新規予約登録ページに遷移できない' do
#       # トップページに遷移する
#       visit root_path
#       # 新規投稿ページへのリンクがないことを確認する
#       expect(page).to have_no_content('新規予約')
#     end
#   end
# end

# RSpec.describe "編集", type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @team = FactoryBot.build(:team)
#     @team.work = 'true'
#     @team.save
#     @schedule = FactoryBot.create(:schedule)
#   end

#   context '予約の編集ができるとき'do
#     it 'ログインしたユーザーは予約の編集ができる' do
#       # ログインする
#       visit new_user_session_path
#       fill_in '名前', with: @user.name
#       fill_in 'パスワード', with: @user.password
#       find('input[name="commit"]').click
#       expect(current_path).to eq(root_path)
#       # 先ほど作成した予約が存在することを確認する
#       visit schedule_path(@schedule.id)
#       # 予約編集ページへのリンクがあることを確認する
#       expect(page).to have_content('予約を変更')
#       click_link '予約を変更'
#       # 予約編集ページに遷移する
#       expect(current_path).to eq(edit_schedule_path(@schedule.id))
#       # フォームに情報を入力する
#         fill_in 'schedule[scheduled_date]', with: (@schedule.scheduled_date)+1
#         select "午後", from: 'schedule[time_zone_id]'
#         select "中", from: 'schedule[size_id]'
#         select "本予約", from: 'schedule[accuracy_id]'
#         select "伊勢", from: 'schedule[mie_id]'
#         select "商社", from: 'schedule[first_contact_id]'
#         # click_button '予約を変更する'
#         # 編集してもTweetモデルのカウントは変わらないことを確認する
#         expect{
#           find('input[name="commit"]').click
#         }.to change { Schedule.count }.by(0)
#     end
#   end
#   context '予約編集登録ができないとき'do
#     it 'ログインしていないと予約編集ページに遷移できない' do
#       # トップページに遷移する
#       visit root_path
#       # 新規投稿ページへのリンクがないことを確認する
#       expect(page).to have_no_content('予約を変更')
#     end
#   end
# end

# RSpec.describe "削除", type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @team = FactoryBot.build(:team)
#     @team.work = 'true'
#     @team.save
#     @schedule = FactoryBot.create(:schedule)
#   end

#   context '予約の削除ができるとき'do
#     it 'ログインしたユーザーは予約の削除ができる' do
#       # ログインする
#       visit new_user_session_path
#       fill_in '名前', with: @user.name
#       fill_in 'パスワード', with: @user.password
#       find('input[name="commit"]').click
#       expect(current_path).to eq(root_path)
#       # 先ほど作成した予約が存在することを確認する
#       visit schedule_path(@schedule.id)
#       # 予約削除ページへのリンクがあることを確認する
#       expect(page).to have_content('予約を削除')
#       # 投稿を削除するとレコードの数が1減ることを確認する
#       expect{
#         find_link('予約を削除', href: schedule_path(@schedule.id)).click
#       }.to change { Schedule.count }.by(-1)
#       # トップページに遷移する
#       visit root_path
#     end
#   end
#   context '予約削除登録ができないとき'do
#     it 'ログインしていないと予約削除ページに遷移できない' do
#       # トップページに遷移する
#       visit root_path
#       # 新規投稿ページへのリンクがないことを確認する
#       expect(page).to have_no_content('予約を変更')
#     end
#   end
# end

RSpec.describe "詳細", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @team = FactoryBot.build(:team)
    @team.work = 'true'
    @team.save
    @schedule = FactoryBot.create(:schedule, user_id:@user.id, team_id:@team.id)
  end

  context '予約の詳細が確認できるとき'do

    it 'ログインしているユーザーは詳細ページに遷移して予約の詳細が表示される' do
      # ログインする
      visit new_user_session_path
      fill_in '名前', with: @user.name
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # トップページに遷移する
      visit root_path
      # 予約詳細ページへのリンクがあることを確認する
      expect(page).to have_content('予約詳細')
      click_link '予約詳細'      
      # 予約の詳細ページに遷移したことを確認確認する
      expect(current_path).to eq(schedule_path(@schedule.id))
    end
    it 'ログインしていなくても詳細ページに遷移して予約の詳細が表示される' do
      # トップページに遷移する
      visit root_path
      # 予約詳細ページへのリンクがあることを確認する
      expect(page).to have_content('予約詳細')
      click_link '予約詳細'      
      # 予約の詳細ページに遷移したことを確認確認する
      expect(current_path).to eq(schedule_path(@schedule.id))
    end
    end
  end