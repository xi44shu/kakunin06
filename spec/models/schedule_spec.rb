require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.create(:schedule)
  end

  describe '新規予約登録' do
    context '新規登録できるとき' do
      it '入力項目が存在すれば登録できる' do
        expect(@schedule).to be_valid
      end
      it 'contentがなくても登録できる' do
        @schedule.content = ""
        expect(@schedule).to be_valid
      end
    end
    context '新規予約登録できないとき' do
      it 'schedule_dateが存在しないと登録できない' do
        @schedule.scheduled_date = ""
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Scheduled dateを入力してください")
      end
      it 'time_zoneに「---」が選択されている場合は登録できない' do
        @schedule.time_zone_id = 1
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Time zone can't be blank")
      end
      it 'teamが紐づいていないと登録できない' do
        @schedule.team = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Teamを入力してください")
      end
      it 'userが紐づいていないと登録できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Userを入力してください")
      end
      it 'accuracyに「---」が選択されている場合は登録できない' do
        @schedule.accuracy_id = 1
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Accuracy can't be blank")
      end
      it 'sizeに「---」が選択されている場合は登録できない' do
        @schedule.size_id = 1
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Size can't be blank")
      end
      it 'first_contactに「---」が選択されている場合は登録できない' do
        @schedule.first_contact_id = 1
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("First contact can't be blank")
      end
    end

  end
  
end
