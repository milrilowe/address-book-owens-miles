# Address Book

Address Book is a simple web-based application for keeping track of people's addresses, emails, and phone numbers. It is built using Ruby on Rails, with a PostgreSQL database for data persistence.

## Requirements

-   Ruby: 3.1.2
-   Rails: 6.1.7
-   PostgreSQL: 12.12

## Setup

To set up the project locally, follow these steps:

1.  Clone the repository to your local machine
2.  Run `bundle install` in the terminal to install the required gems
3.  Run `yarn install` in the terminal to install the required JavaScript packages
4.  Run rake `db:setup` in the terminal to setup the database
6.  Run `rails s` in the terminal to launch the web server
7.  The application should now be viewable at `localhost:3000`

## Usage

To use Address Book, follow these steps:

#### 1.  Create an account by providing an email and password

<div style="display:flex">
     <div style="flex:1;padding-right:10px;padding-left:20px">
          <img src="https://github.com/milrilowe/address-book-owens-miles/blob/main/public/images/signup.png" width="350"/>
     </div>
</div>

#### 2.  Once logged in, press the + button to add a new person

<div style="display:flex">
     <div style="flex:1;padding-right:10px;">
          <img src="https://github.com/milrilowe/address-book-owens-miles/blob/main/public/images/home.png" width="350"/>
     </div>
</div>

#### 3.  Fill in the person's details and click `Create Person`

<div style="display:flex">
     <div style="flex:1;padding-right:10px;">
          <img src="https://github.com/milrilowe/address-book-owens-miles/blob/main/public/images/create.png" width="350"/>
     </div>
</div>

#### 4. To view or edit a person's addresses, emails, or phone numbers, click on their name and use the appropriate add/edit buttons

<div style="display:flex">
     <div style="flex:1;">
          <img src="https://github.com/milrilowe/address-book-owens-miles/blob/main/public/images/person.png" width="350"/>
          <img src="https://github.com/milrilowe/address-book-owens-miles/blob/main/public/images/address.png" width="350"/>
     </div>
</div>

## Testing

To run the tests for the application, run:

1.  `rails test test/models` to test models
2.  `rails test test/controllers` to test controllers
3.  `rails test test/msystem` to test the application story
