# Event_Management_with_SpringBoot_React
Event Management System with React front-end, Java with Spring Boot Backend and MySQL Database.

Event Management System

Description:
The Event Management System is a web-based application used to facilitate the management of events. Its main Functionalities include creating events, updating event details, and deleting events. Users can register and login to the portal. Users can also view a list of upcoming events and register for events.

This System has 3 modules:

1) User Registeration and Login
2) User Functionalities
3) Admin Functionalities

User Registeration and Login:
This module facilitates the new user to register and existing ones to login using their email and password. This module has 2 logins: user login and Admin login.

User Functionalities:
It consists of following features:

1) User Dashboard - showing list of upcoming events and here user can be able to register for the events.
2) Create event - enables user to create new events by providing event details like title, description, date, time and location.
3) Edit Event - shows the list of events created by that particular user and he/she can be able to edit the event details in this page.
4) My Profile - displays the user info, user can be able to update their profile.
5) Log out - log out of the account and gets back to login page.

Admin Functionalities:
It has the following features:

1) Admin Dashboard - showing list of all events with number of registrations and respective attendees list.
2) Manage Events - Allows the admin to delete events(soft delete).
3) Manage Users - Allows the admin to delete users(soft delete).
4) Log out - log out of the account and gets back to login page.

Technologies Used:

Front-end: React
Back-end: Java with Spring Boot
Database: SQL (MySQL)

Database Schema:
This system has 4 tables totally:

1) admin(admin_id, admin_name, hashed_password, email, location) - PK: `admin_id`
2) user(user_id, user_name, hashed_password, email, location, active, no_of_events_hosted, no_of_registered_events) - PK: `user_id`
3) event(event_id, title, description, date, time, location, active, user_id, last_modified, no_of_attendees) - PK: `event_id`, FK: user.user_id
4) event_registration(event_registration_id, event_id, user_id, time_stamp) - PK: `event_registration_id`, FK: user.uiser_id, event.event_id

Repository Structure:
This repository has 2 folders and 1 file:

1) Frontend - it has front-end app `event-management`.
2) Backend - It has backend root folder `demo`.
3) SQL File `event-management-db-schema-sql-queries.sql` - It contains all the queries starting from creating database, creating tables, creating triggers and inserting Admin records. Need to execute this sql file in order to create the database in local for this event management system.

Steps to clone and run the application:
1) Execute all the SQL Queries in the `event-management-db-schema-sql-queries.sql` file. This will create the db in your local.
2) Clone the back end folder `demo`:
   --> Need to change my database credentials to yours - Go to the application.properties file in the path **C:\Users\sound\Downloads\demo\demo\src\main\resources\application.properties** and change spring.datasource.username=your_username and spring.datasource.password=your_password
3) Now our backend is raedy, start the backend server.
5) Then, Clone the front end folder `event-management`:
     --> Need to install all the packages - Run `npm installl` -this will install all the packages in node_modules.
6) Now front-end is raedy, start the application by `npm start`.
7) Our application will get started on `localhost:3000` by default, there you will be able to see our login page.

   
