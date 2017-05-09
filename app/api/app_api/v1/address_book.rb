module AppAPI::V1
  class AddressBook < Grape::API
    helpers AppAPI::SharedParams
    resources :address_books do

      desc "创建地址簿" do
        success AppAPI::Entities::AddressBook 
      end
      params do
        requires :name, type: String, desc: '收货人名字'
        requires :mobile_phone, type: String, desc: '电话'
        optional :full_address, type: String, desc: '收货地址'
      end
      post do
        authenticate!
        address_book = current_user.address_book || current_user.build_address_book
        address_book.name = params[:name]
        address_book.mobile_phone = params[:full_address]
        address_book.full_address = params[:full_address]
        error! address_book.errors unless address_book.save
        present address_book, with: AppAPI::Entities::AddressBook
      end

      desc '查看地址簿' do
        success AppAPI::Entities::AddressBook
      end
      get 'my' do
        authenticate!
        present current_user.address_book, with: AppAPI::Entities::AddressBook
      end

    end # end of resources
  end
end
