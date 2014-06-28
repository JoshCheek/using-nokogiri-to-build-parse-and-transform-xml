Nokogiri Example
----------------

Run `ruby build.rb` to see the XML that it builds (saved into feed.xml).

Run `ruby parse.rb` to see an example of parsing out the link's href,
and the entry's title.

Run `ruby transform.rb` to see an example of using an xsl transform
to generate an html document of the titles.

NOTE: I'm pretty sure the example XML I build isn't a valid Atom feed,
but it's approximately realistic, so it makes a decent candidate
for parsing and transforming. But, if you wind up making one,
send me a pull request, so anyone else who finds this can benefit.

MIT LICENSE
-----------

The MIT License (MIT)

Copyright (c) 2014 Josh Cheek <josh.cheek@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
