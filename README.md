### To apply you should follow the instructions below:

- Fork this repo
- Look at the specification below and do your thing
- Open a Pull Request (optionaly if you have a problem with doing it in the public domain send the repo in a zip file)

We will review the code and if necessary discuss within the pull request.

### Challenge spec:

#### Bugfix:

There's a bug in our current implementation: the upvote is not being saved.

**Importante note:** Save upvotes using our current implementation (there's no need to add new features such as user account or per use votes)

#### New feature:

When clicking on a comic we want to view the comic details: title, issue number, variant description, ISBN, characters, images and creators. It should open an overlay over the current content.

### Evaluation Criteria
 - Maintainable code
 - Code architecture design
 - Testability
 - User experience

Feel free to change whatever you think needs to be changed.
The more detail the better.

### Installation
#### Backend
  - `bundle install`

#### Frontend
- `cd frontend`
- `npm install`

### Database Configuration
  - `rake db:create`
  - `rake db:migrate`


### Running
`rails s`

**Important**:
The `rails s` will also run `cd frontend && npm run build`.
Don't forget to install the frontend before run `rails s`. The `npm run build` will copy static files to the `/public` folder.
