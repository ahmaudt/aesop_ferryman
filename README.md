# Aesop's Ferryman  

Aesop's Ferryman is a Ruby/Sinatra application for creating academic petitions in collegiate and university environments.

## Installation

Clone the repository locally:

`$ git clone git@github.com:<your-github-username>/aesop_ferryman.git`

Then execute:

`$ bundle install`

Once the dependencies have been installed, you are ready to setup migrations. You should run the following command to migrate to your db:

`$ rake db:migrate`

Currently, only the tables created by the migrations listed below are used:

`20210515171801_create_advisors.rb`
`20210515171808_create_students.rb`
`20210515171816_create_petitions.rb`
`20210519193701_add_new_petition_columns.rb`
`20210520152948_add_permit_override_column.rb`

The remaining migrations are intended for functionality that has yet to be built.

## Usage

To run the software, execute:

`$ shotgun`

You will see some output in the terminal, with the URL. Navigate to the following URL:

`http://your-server/create_acct` to create an account.

Once you have created an account, you may login to the application using the credentials you set when creating your account.
The software routes you to the `/dashboard`, which lists several recent petitions--if they exist. You will need to create a list of students or create a seed file. If you wish to add students to your db, be sure their `advisor_id` is set to the proper advisor, and tha advisor account has been created.
After creating the seed file, `seeds.rb`, execute the followign command:

`rake db:seed`

The records will be added to your database and will be available for use by this application. Once students have been created or seeded,
you will be able to create petitions.

    PLEASE NOTE: IF YOU DO NOT CREATE STUDENT RECORDS, OR SEED YOUR DATABASE WITH
    STUDENT RECORDS, YOU WILL NOT BE ABLE TO CREATE ANY PETITIONS.

To create petitions, navigate to `http://your-server/petitions`. There are four types of petitions an advisor can create:

1. Permit-Overrides
2. Exceptions
3. Substitutions
4. Waivers
