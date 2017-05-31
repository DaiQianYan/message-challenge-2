# Writing a messaging application

![what it should look like](./public/screenshot.png)

What we'd like is a simple messaging dashboard where users can talk with other users and search through their messages quickly, a lot like Wechat's group messaging. The application must be able to:

1. Organize messages by thread, sorted by their last response time.
2. Support multiple users chatting in the same thread.
3. Messages should be marked "unread" when the thread includes a response not seen, and marked as "read" when the message is opened.
4. Support listing thousands of messages efficiently
5. A user can only access messages sent to them, and messages they've sent.

## Getting started

We've provided a sample view page and some sample users to save you some time. 

If you haven't already, [install Ruby and PostgreSQL](https://gorails.com/setup/osx/10.12-sierra), `cd` into the directory, and run the following commands.

Let's get this running:
```bash
$ git clone git@cd.i.strikingly.com:strikingly/message-challenge.git  # clone the repository
$ cd message-challenge  # go into it
$ bundle install  # install the gems
$ rake db:setup  # setup the database
$ rails db:migrate  # migrate the DB
$ rails s  # start the server
```

And visit http://localhost:3000/ in your browser.


## Functional requirements

Please read through these carefully and ask if there is something you don't understand.

The goal is to have a web-based messaging system where users can converse in a message thread. If a message thread is clicked, all replies in that thread should be displayed in chronological order. If a thread has a new reply that a user hasn't opened yet, it should be marked as "unread". It should allow a user

## Technical requirements

In your implementation, we'd prefer you to constrain your solution to the main technologies currently used within Strikingly: Rails, Redis, Memcached, and PostgreSQL. You can create as many models as you'd like and add any gem that would speed up development. Some things to keep in mind:

- **Performance:** The system should be able to support many messages. Over 1000, no more than 10k. This scale usually reveals poor queries (e.g: [N+1 queries](http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations)) and prohivitively inefficient data design.
- **Security:** A user should not be able to reply or view a thread that they are not participating in. XSS attacks shouldn't be possible.

## Non-Requirements

- **Authentication:** You don't have to worry with the sign-out/sign-in/sign-up work. If you want to act as another user, you can modify the application_controller#current_user method with any of the default users: Dafeng, Xiaoyu, Daniel, Joyce, Tyler, Batman.

- **Interface for creating a new message:** Creating a new message thread can be done via the console.
