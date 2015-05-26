# Ruby assessment for trycatch.us

## The assignment

The assignment is as follows:

- It must by API (REST, JSON)
- It must be secured by basic auth
- It must contain User mode with different roles (admin, user, guest)
- It must limit access to given part of API depend of User role
- Admin has access to everything
- User can read all, create all, but update and deleted only his records
- Guest has only read access
- There should be at least 2 different models except User
- Those models should be in relation (1 to many)

## The plan

Let's analyze this:

### REST/JSON

If it should be REST, use RAILS. If JSON is the exchange format, we must add jbuilder to it because then we can 
easily build the JSON files as views. 

### Basic authentication and user roles

Use the devise gem to handle authentication. It can do BASIC authentication and determine the role of the current 
user. Anyone that is not logged in is a guest. Anyone logged in can be an admin based on one of the user attributes. 
I could have done this differently but doing it this way is the easiest way to do it.

### Roles and authorization and limiting access

A gem called cancan has been modernized as cancancan. It provides authorization based on a specification in the
Ability model. I use it to authorize actions in the respective models. Any authorisation violation is signalled
with an exception and a redirect to the start page where a notification is displayed.

### At least two models besides User and the relation between them

There are two models besides User. Those are Question and Answer:

    User 1..n Question 1..n Answer
    
### How does this work?

To make the system work you need to do the following:

1. set up a working ruby environment, preferably with RVM, and install ruby-2.2.2
2. run bundle install to fetch the necessary gems, run database migration, run database seeds to add admin user
3. start up delayed_job with ./bin/delayed_job start
4. start the application ./bin/rails server -b 0.0.0.0 -p 3000 -e development
5. surf to http://localhost:3000/ and enjoy
6. to excercize the JSON REST API use a tool like Paw. The URIs are in principe the same as de web application
   but need to be prepended with /api/v1 to work.
   
### Design decisions

1. solve a lot of trouble creating a REST API by using a framework that does this for you: RAILS
2. mix and match a number of gems that cover part of the requirements: devise and cancancan for example
3. separate the JSON API and the web application into different parts even if they overlap for a large part. 
   A JSON API is a different way of accessing and manipulating the underlying models so it should be separate.
   An API is not a single class but Single Responsibility Principe applies.
4. Add googling the answers just to show off a bit and to be able to show that I realize that jobs that take
   a long time need to be handled asynchronously.