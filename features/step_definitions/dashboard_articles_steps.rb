Before do
  @params = { title: 'Foobar', body: 'Lorem ipsum' }
end

When(/^I create new article$/) do
  click_link 'New Article'
  fill_in :article_title, with: @params[:title]
  fill_in :article_body, with: @params[:body]
  click_button 'Create Article'
end

Then(/^I should see it at index page$/) do
  within('.article') do
    expect(find('.title').text).to eq @params[:title]
    expect(find('.body').text).to eq @params[:body]
  end
end

When(/^I create empty article$/) do
  click_link 'New Article'
  fill_in :article_title, with: ''
  fill_in :article_body, with: ''
  click_button 'Create Article'
end

Then(/^I should not see it was created$/) do
  expect(find('#error_explanation>h2').text).not_to be_blank
end
