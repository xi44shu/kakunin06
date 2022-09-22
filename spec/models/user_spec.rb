require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it '入力項目が存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'adminがtrueでも登録できる' do
          @user.admin = 'true'
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nameが空では登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nameを入力してください")
        end
        it 'emailが空では登録できない' do
          # emailが空では登録できないテストコードを記述します
          @user.email ="" 
          @user.valid?
          expect(@user.errors.full_messages).to include("Emailを入力してください")      
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
        end
        it 'emaiは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Emailは不正な値です')
        end
        it 'passwordが空では登録できない' do
            @user.password = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Passwordを入力してください")
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Passwordは6文字以上で入力してください')
        end
        it 'passwordが129文字以上では登録できない' do
          @user.password = Faker::Internet.password(min_length: 129)
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Passwordは128文字以内で入力してください")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
            @user.password = '123456'
            @user.password_confirmation = '1234567'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
        end
        it 'adminが空では登録できない' do
          @user.admin = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Adminは一覧にありません")
        end
      end
  end
end
