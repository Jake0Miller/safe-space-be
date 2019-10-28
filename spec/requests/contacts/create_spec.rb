require 'rails_helper'

describe 'POST contact' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @user_1 = @center_1.users.create!(name: 'Jake')

    expect(Contact.count).to eq(0)
  end

  it 'I can create a new contact' do
    mutation = %(mutation {
                  createContact (
                      name: "Ian"
                      phone: "555-555-5555"
                      userId: #{@user_1.id}
                    ) {
                    contact {
                      id
                      name
                      phone
                      userId
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    contacts = Contact.all
    data_contact = contacts.first

    expect(contacts.length).to eq(1)

    contact = JSON.parse(response.body, symbolize_names: true)[:data][:createContact][:contact]

    expect(contact[:id]).to eq(data_contact.id.to_s)
    expect(contact[:name]).to eq(data_contact.name)
    expect(contact[:phone]).to eq(data_contact.phone)
  end
end
