require 'rails_helper'

feature 'user interacts with new account' do

  # let!(:user) { User.create(username: "User1") }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user creates a new account' do
    visit new_user_registration_path

    fill_in 'Username', with: "User1"
    fill_in "Email", with: "user1@email.com"
    fill_in "Password", with: "usertest"
    fill_in "Password confirmation", with: "usertest"

    click_button "Sign up"

    expect(page).to have_content("signed in as User1")
  end

  scenario 'user signs into account' do
    login_as(user)
    visit "/"

    expect(page).to have_content("signed in as User2")
  end

  scenario 'user signs out of account' do
    login_as(user)
    visit "/"
    click_link "sign_out"

    expect(page).to have_link("sign_in")
  end

  scenario 'signed-in user updates account' do
    login_as(user)
    visit edit_user_registration_path

    expect(page).to have_content("Would you like to edit your information?")
  end

  scenario 'signed-in user deletes account' do
    login_as(user)
    visit edit_user_registration_path
    click_button "Cancel my account"

    expect(page).to have_link("sign_in")
  end

end

  # scenario 'unauthorized users are redirected' do
  #   login_as(user)
  #   visit '/admin/users'
  #   expect(page).to have_content('not authorized')
  #   expect(current_path).to eq(root_path)
  # end
