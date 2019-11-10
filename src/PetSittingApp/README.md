# Pet Sitting Website

Website: [PetSittingWebsite](https://enigmatic-wildwood-24997.herokuapp.com/)

GitHub: [PetSittingWebsite.github](https://github.com/MelB-24/pet-sitting-app)


### Identification of the problem you are trying to solve by building this particular marketplace app.

This marketplace website I am building is a Pet Sitting app that allows users to sign up to watch dogs or owners to send their dogs to a sitter. Although there are a few services that allow this, there is not one that is well known and used in Australia. 

## Why is it a problem that needs solving?

The pet business is one of the biggest growing industries in the world, including pet food, grooming, day care and more. There are a few websites such as this overseas however none are that well known in Australia. A website like this could be changed to suit a clients needs including making it into a singular businesses website for doggy day care to allow their clients to book their dogs into day care. A website like this one could become very big in Australia with the ever growing pet industry. 

## Description of your marketplace app (website), including:
- Purpose

The purpose of my website is to allow a person who would like to pet sit dogs, sign up to the site to make it very easy for them to find clients. Owners of dogs can also sign up on the website to easily find sitters in their area to send their dogs to. 

- Functionality / features

Features of my website include owners creating their own profile as well as a profile for each of their pets. Owners can view all the sitters that are signed up to the website and in future would like to be able to search via names, area and price. They can view a calender and can start to make a booking via a sitter that they have previously approved to pet-sit. Sitters can view their calender of bookings that their owners have made and choose whether they approve the booking based on availability etc. By not approving a booking, in future I would like to implement an email system that notifies an owner if a sitter cannot approve the booking. 

- Sitemap

![Pet Sitting Site Map](docs/pet-sitting-site-map.png)

- Screenshots

![Home Page](docs/home-page-screenshot.png)
![Sign Up Page](docs/sign-up-screenshot.png)
![Sign In Page](docs/login-screen-shot.png)
![Bookings Page](docs/bookings-screenshot.png)
![Pet Profile Page](docs/dogs-profile-screenshot.png)


- Target audience

The audiences targeted for my website are owners of pets looking for people to look after their dogs and people who would like to earn some money pet sitting. 

- Tech stack (e.g. html, css, deployment platform, etc)

Used in this website is Ruby on Rails. The website has been deployed on Heroku. 

## User stories for your app

"As an owner of a pet, I want to be able to easily sign up for a website.  where I can save my , so that they can get some exercise when I'm not home."
"As a person with a lot of spare time and a love for pets, I want to be able to care for other people's dogs so I can earn some extra money."
"

## Wireframes for your app

![Wireframes](docs/wireframes.png)

## An ERD for your app

![ERD](docs/ERD.png)

## Explain the different high-level components (abstractions) in your app

1. Active Record - active record is what makes up the M or Model of the MVC concept. Active record is responsible for the data and the creation of objects while storing in the database. Active record allows us to make relationships in our models in order to easily access the database. For example in the controller we can call `current_owner_user.owner.bookings` which will return us all of the bookings that are associated with the owner that is currently logged in.

2. Form helpers were used in this assignment to validate the forms according to the database design. They are used to collect data from the user and input into the database. 

## Detail any third party services that your app will use

In the start I had intended to use stripe for payment services, but due to time restraints I wasn't able to implement this feature. I have used AWS to store the images that a user uploads when they create a dogs profile. Other third party services that I would like to implement is MailGun, I would like this to be used in conjuction with bookings, for an email to be sent to a sitter when a booking is made and an email sent to the owner when a sitter approves their booking. The gems used in this website are devise and simple calender. Devise was used to allow the users to login and have their own profile and dashboard in accordance to the role they are logged in as. I have used the simple calendar gem to show the users bookings to them in a easy to read format instead of an unordered messy list. I made a start on using bootstrap however I found it quite hard to implement so I had ended up doing the majority of the css styling myself. 

## Describe your projects models in terms of the relationships (active record associations) they have with each other. Discuss the database relations to be implemented in your application

As seen in the ERD I have kept my design quite simple. I have used the devise gem to create authentication and then created the one-to-one relationship with the sitter and owner table to avoid the need to edit the devise database design. I have created a one-to-many relationship between an owner and their dogs, because in this website an owner can have many dogs but a dog can only belong to one user. The dog table also `has_one_attached` which allows for the use of active storage and AWS for user uploaded photos. The bookings table is used to avoid the many-to-many relationship between an owner and sitter, as a booking can be made between an owner and sitter which is a one-to-one relationship. The approved sitters table is used as an owner must 'approve' a sitter before making a booking with them, this is a form of security for the users of the app so that they can only make bookings with prior approval of a sitter. 

## Provide your database schema design

````ruby
ActiveRecord::Schema.define(version: 2019_11_04_044738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "approved_sitters", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_approved_sitters_on_owner_id"
    t.index ["sitter_id"], name: "index_approved_sitters_on_sitter_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "approved_sitter_id"
    t.boolean "approved_booking"
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["approved_sitter_id"], name: "index_bookings_on_approved_sitter_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.date "date_of_birth"
    t.bigint "microchip_number"
    t.text "bio"
    t.integer "sex"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "owner_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_owner_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owner_users_on_reset_password_token", unique: true
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_user_id"], name: "index_owners_on_owner_user_id"
  end

  create_table "sitter_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sitter_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sitter_users_on_reset_password_token", unique: true
  end

  create_table "sitters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "suburb"
    t.string "state"
    t.integer "postcode"
    t.string "business_name"
    t.integer "price"
    t.bigint "sitter_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_user_id"], name: "index_sitters_on_sitter_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "approved_sitters", "owners"
  add_foreign_key "approved_sitters", "sitters"
  add_foreign_key "bookings", "approved_sitters"
  add_foreign_key "dogs", "owners"
  add_foreign_key "owners", "owner_users"
  add_foreign_key "sitters", "sitter_users"
end
````

## Describe the way tasks are allocated and tracked in your project

In this app I sorted tasks into Tech, README, and Slideshow lists in a trello board. I used these lists to tick off one by one what I had completed by changing the colours to green.  

![Trello 1](docs/trello.png)
![Trello 2](docs/trello2.png)
![Trello 3](docs/trello3.png)


