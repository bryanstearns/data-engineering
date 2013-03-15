# Challenge for Software Engineer - Bryan Stearns

## Project Description
Imagine that LivingSocial has just acquired a new company.  Unfortunately, the company has never stored their data in a database and instead uses a plain text file.  We need to create a way for the new subsidiary to import their data into a database.  Your task is to create a web interface that accepts file uploads, normalizes the data, and then stores it in a relational database.

The application:

1. Accepts (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name.  I've assumed the columns will always be in that order, that there will always be data in each column, and that there will always be a header line.  An example input file named example_input.tab is included in this repo.
1. Parses the given file, normalizes the data, and stores the information in a relational database.
1. After upload, displays the total amount gross revenue represented by the uploaded file.

The application:

1. does not handle authentication or authorization, even though this might've gotten me bonus points
1. is not written in the simplest possible framework (I'm better at Rails than Sinatra, though if a tiny app like this were going to live a long life, it might be more appropriately written in a lighter-weight framework!)
1. is not aesthetically pleasing (I could've installed Twitter Bootstrap, but as with authentication, you'd just be evaluating my ability to install and configure others' gems).

## Setup

First, install Ruby 1.9.3 (p392 or newer) if you don't have it already. There are installation instructions here: http://www.ruby-lang.org/en/downloads/

Then, in a command shell:

1. Clone the project from Github:
```
$ git clone git://github.com/bryanstearns/data-engineering.git
```

1. cd into the directory created and run Bundler to install the project's dependencies:
```
$ bundle --binstubs
```

1. Create the database:
```
$ bin/rake db:migrate
```

1. Start a server for the application:
```
$ bin/rails server
```

1. Click on this link to view the application in your browser: [http://localhost:3000/](http://localhost:3000/) (You'll find a sample file to upload, example_input.tab, in the project directory.)

After you've tried it, you might enjoy running the tests:

1. Make the test database match the development database
```
$ bin/rake db:test:clone
```

1. Run them -- they're the default Rake task, so it's just:
```
$ bin/rake
```

## Decisions, decisions

As a programming challenge, this project was completed in a vacuum, without the luxury of being able to ask clarifying questions. I made a few choices:

- Normalization: the task called for normalized data. I elected to think of two merchants with the same name but different addresses as distinct merchants; likewise, I chose to consider two products with different prices as distinct products.

- Error handling: I was told I could assume the file structure, so I successfully resisted the temptation to verify it and report errors, though these would be desirable.

- Data size: By default, Rails only provides a way to read all of an uploaded file; real-world data could easily strain memory. Alternate solutions exist, but I didn't try them.

Thanks for your consideration!
...Bryan
