require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Shows welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome')
  end

  scenario 'Verify registration link' do
    visit(root_path)
    expect(find('ul li')).to have_link("Client Registration")
  end
end
