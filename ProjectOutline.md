Textbook Sharing
## Questions
1. What are we building?
2. Who are we building it for?
3. What features do we want to have?

1. Textbook sharing. A place where Claremont Colleges students can find and
  share textbooks with eachother
2. Claremont Colleges students
3. Features:
    - Add and remove textbook entries
    - Search for textbooks
    - Contact the owner of the textbook
    - Claremont college authentication

## User Stories; UserA - Selling book, UserB - Buying book
  - As a userB, I want to be able to search for textbooks that I need
  - As a userB, I want to be able to get in contact with the person who has the
  book that I need
  - As a userA, I want to be able to remove my book entry when it has been sold
  - As a userA, I want to be able to add a book entry

## Data
  **Textbook**
    - Title
    - Author
    - ISBN
    - College
    - Price
    - Email _for authentication_
    - Facebook/Messenger Link

## Pages
  - Welcome Page (welcome#index) _Claremont College authentication_
  - Textbooks (textbook#index)
  - Textbook New (textbook#new)

### Hosting requirements:
   - Set up our own server
   - Get a static IP from CIS (talk to Evan Khan about that)
   - Get a domain name for the site
