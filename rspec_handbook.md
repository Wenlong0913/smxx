# Rspec使用手册

## Model 测试

###### 保存数据后是否有特定的错误

    it 'is invalid without mobile_phone' do
      flag, user = User::Create.(password: 'abc1234')
      expect(flag).to be(false)
      expect(user.errors[:mobile_phone]).not_to be_empty
    end

