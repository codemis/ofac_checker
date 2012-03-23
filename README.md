# OFAC Reader [Still in Development]

A Ruby script that looks through your bank .ach or .csv file, and compares the payees with the current [OFAC](http://www.treasury.gov/about/organizational-structure/offices/Pages/Office-of-Foreign-Assets-Control.aspx) list.  It will generate a CSV file with the results, and notify you when it has been completed by email.  Once you drop a file in the staging directory,  you can run a Rake command to process the document.  The command is:

```ruby
rake ofac_checker:process
```

## Requirements

* Ruby 1.9.2
* MySql

## Installing

* Download of copy of the code, and unzip in a convenient location
* Make sure to install Ruby on your computer/server
* Make sure to install MySql on your computer/server
* Run the bundle command to install all necessary gems
* Rename **settings.example.yml** to **settings.yml** and configure the settings
* Rename **database.example.yml** to **database.yml** and configure the settings to match your current database
* Drop your file into your staging folder to be processed.  You set the staging folder in your settings.yml file
* Now run the rake command:

```ruby
rake ofac_checker:process
```

## Configure the Script

* copy the settings.example.yml to settings.yml
* set **staging** to the location where your files will reside before being processed (default: file_bin/staging)
* set **completed** to the location where your results file will be stored (default: file_bin/completed)
* set **email_smtp** to the email smtp settings of your email server in order to get an email upon completion
* set **file > csv > name_header** to the header of the column that the CSV uses to list the payee names
* set **file > ach** currently does not do anything,  because ACH files are standardized


## Development

Questions or problems? Please post them on the [issue tracker](https://github.com/codemis/ofac_checker/issues). You can contribute changes by forking the project and submitting a pull request.

This script is created by Johnathan Pulos and is under the MIT License.