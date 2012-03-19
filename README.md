# OFAC Reader
## Still in Development

A Ruby script that looks through your ach file, and compares the payees with the current OFAC list.  It will generate a CSV file with the results, and notify you when it has been completed by email.  Once you drop a file in the staging directory,  you can run a Rake command to process the document.  The command is:

```ruby
rake ofac_checker:process
```

## Installing Ruby

## Setting Up the CRON Task

## Configure the Script

* copy the settings.example.yml to settings.yml
* set **staging** to the location where your files will reside before being processed (default: file_bin/staging)
* set **completed** to the location where your results file will be stored (default: file_bin/completed)


## Development

Questions or problems? Please post them on the [issue tracker](). You can contribute changes by forking the project and submitting a pull request.

This script is created by Johnathan Pulos and is under the MIT License.