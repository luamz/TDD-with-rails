require 'rails_helper'

feature "Customers", type: :feature do

  scenario 'Verify registration link' do
    visit(root_path)
    expect(page).to have_link('Client Registration')
  end

  scenario 'Verify new client link' do
    visit(root_path)
    click_on('Client Registration')
    expect(page).to have_content('Listing Clients')
    expect(page).to have_link('New Client')
  end

  scenario 'Verify new client form link' do
    visit(customers_path)
    click_on('New Client')
    expect(page).to have_content('New Client')
  end  

  scenario 'Registrates new valid client' do
    visit(new_customer_path)
    customer_name = Faker::Name.name

    fill_in('Name', with: customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('Avatar',"#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['Y','N'].sample)
    click_on('Create Client')
    expect(page).to have_content('Client successfully registered')
    expect(Customer.last.name).to eq(customer_name)
  end

  scenario 'Does not registrates new client' do
    visit(new_customer_path)
    click_on('Create Client')
    expect(page).to have_content("can't be blank")
  end

end
