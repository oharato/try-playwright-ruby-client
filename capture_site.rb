require 'playwright'

Playwright.create(playwright_cli_executable_path: './node_modules/.bin/playwright') do |playwright|
  playwright.chromium.launch(headless: true) do |browser|
    page = browser.new_page
    page.goto('https://github.com/YusukeIwaki')
    page.screenshot(path: './YusukeIwaki.png')
  end
end