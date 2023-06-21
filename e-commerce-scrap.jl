using HTTP
using Gumbo
using Cascadia

url = "https://webscraper.io/test-sites/e-commerce/allinone"

response = HTTP.get(url)
parsed_page = parsehtml(String(response.body))

content_div = eachmatch(Selector("body > div.wrapper > div.container-fluid.blog-hero > div > div > div > h1"), parsed_page.root)

for div in content_div
    println(Gumbo.text(div))
end
