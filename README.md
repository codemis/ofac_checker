# OFAC Reader

A Ruby script that looks through your ach file, and compares the payees with the current OFAC list.  It will generate a CSV file with the results, and notify you when it has been completed by email.

## Installing Ruby

## Setting Up the CRON Task

## Configure the Script

* copy the settings.example.yml to settings.yml
* set **staging** to the location where your files will reside before being processed
* set **completed** to the location where your results file will be stored


## Development

Questions or problems? Please post them on the [issue tracker](). You can contribute changes by forking the project and submitting a pull request.

This script is created by Johnathan Pulos and is under the MIT License.