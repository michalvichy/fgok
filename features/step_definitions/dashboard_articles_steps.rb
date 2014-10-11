When(/^I create new article$/) do
  click_link 'New Article'
  fill_in :article_title, with: 'Foobar'
  fill_in :article_body, with: 'Lorem ipsum'
  click_button 'Create Article'
end

Then(/^I should see it at index page$/) do
  within('.article') do
    expect(find('.title').text).to eq 'Foobar'
    expect(find('.body').text).to eqe 'Lorem ipsum'
  end
end
