feature 'Enter names' do
  scenario 'submitting names, both are then visible' do
    sign_in_and_play
    page.should(satisfy do |page|
      page.has_content?('John') && page.has_content?('Laura')
    end)
  end
end