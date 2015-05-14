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

## Analysis

Let's analyze this:

### REST/JSON

If it should be REST, use RAILS. If JSON is the exchange format, we must add jbuilder to it because then we can 
easily build the JSON files as views. 

### Basic authentication and user roles

Use the devise gem to handle authentication. It can do BASIC authentication and determine the role of the current 
user.

### Roles and authorization

cancan? or something more modern?

