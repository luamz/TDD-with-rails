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

  scenario "Shows a client" do
    customer = create(:customer)
    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)

  end

  scenario "Indexes clients" do
    customer1 = create(:customer)

    customer2 = create(:customer)

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
    
  end

  scenario 'updates a client' do
    customer = create(:customer)
    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in('Name', with: new_name)
    click_on('Update Client')
    expect(page).to have_content('Client successfully updated')
    expect(page).to have_content(new_name)
  end

  scenario 'link to show at index' do
    customer1 = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[2]/a').click
    expect(page).to have_content("Showing Client")
  end

  scenario 'link to edit at index' do
    customer1 = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[3]/a').click
    expect(page).to have_content("Editing Client")
  end

  scenario "Deletes client", js:true do
    customer1 = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[4]/a').click
    1.second
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Client successfully deleted')

  end

end
