require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = FactoryBot.build(:team)
  end

    describe 'チーム新規登録' do
      context '新規登録できるとき' do
        it '入力項目が存在すれば登録できる' do
          expect(@team).to be_valid
        end
        it 'workがtrueでも登録できる' do
          @team.work = 'true'
          expect(@team).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'team_nameが空では登録できない' do
          @team.team_name = ''
          @team.valid?
          expect(@team.errors.full_messages).to include("Team nameを入力してください")
        end
        it 'affiliationが空では登録できない' do
          @team.affiliation = ''
          @team.valid?
          expect(@team.errors.full_messages).to include("Affiliationを入力してください")
        end
        it 'workが空では登録できない' do
          @team.work = ''
          @team.valid?
          expect(@team.errors.full_messages).to include("Workは一覧にありません")
        end
      end
    end
end
