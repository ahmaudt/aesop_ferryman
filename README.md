# Aesop's Ferryman  

Aesop's Ferryman is a Ruby/Sinatra application for creating academic petitions in collegiate and university environments.

## Installation

Clone the repository locally:

`$ git clone git@github.com:<your-github-username>/aesop_ferryman.git`

Then execute:

`$ bundle install`

Once the dependencies have been installed, you are ready to setup migrations. You should run the following command to migrate to your db:

`$ rake db:migrate`

The command will create the following tables in sqlite3:

`advisors`
`students`
`petitions`


The remaining migrations are intended for functionality that has yet to be built.

## Usage

To run the software, execute:

`$ shotgun`

You will see some output in the terminal, with the URL. Navigate to the following URL:

`http://localhost:9393/account/new` to create an account.

Once you have created an account, you may login to the application using the credentials you set when creating your account.
The software routes you to the `/dashboard`, which lists several recent petitions--if they exist. You will need to create a list of students or create a seed file. If you wish to add students to your db, be sure their `advisor_id` is set to the proper advisor, and tha advisor account has been created.
After creating the seed file, `seeds.rb`, execute the following command:

`rake db:seed`

The records will be added to your database and will be available for use by this application. Once students have been created or seeded,
you will be able to create petitions.

**PLEASE NOTE: IF YOU NEITHER CREATE STUDENT RECORDS, NOR SEED YOUR DATABASE WITH
STUDENT RECORDS, THE APP WILL THROW A VALIDATION ERROR, AND YOU WILL NOT BE ABLE TO CREATE ANY PETITIONS.**

To create petitions, navigate to `http://localhost:9393/petitions`. There are four types of petitions an advisor can create:

1. Permit-Overrides
2. Exceptions
3. Substitutions
4. Waivers

## License

This sofware is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
