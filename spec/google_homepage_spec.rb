# A basic Capybara primer using the Google homepage: https://www.google.com/
RSpec.feature "Google Homepage" do
  let(:url) { "https://www.google.com/" }

  context "when visiting the Google Homepage" do
    let(:search_bar_selector) { "[name='q']" }
    it "has a visible search bar" do
      Capybara.visit(url)
      expect(page).to have_selector(search_bar_selector)
    end
    it "can be used to search for a query" do
      Capybara.visit(url)
      page.fill_in("q", with: "Hello World!")
      sleep(1)
      page.find("[name='btnK']", obscured: false).click
    end
  end
end
