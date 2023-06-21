using HTTP
using Gumbo
using Cascadia  # Don't forget this!

# The URL of the article
url = "https://en.wikipedia.org/wiki/Julia_(programming_language)"

# Send a GET request
response = HTTP.get(url)

# Parse the response body to an HTML Document
parsed_page = parsehtml(String(response.body))

# Select the content of the article using CSS selectors
content_div = eachmatch(Selector(".mw-parser-output"), parsed_page.root)

# Now, content_div holds the main text of the Wikipedia article
for div in content_div
    println(Gumbo.text(div))
end
