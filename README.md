# README
.

Billing And Recurring System is a Point of Bill payment system to accept the payment. The only requirement is an internet connection, there are no third parties involved.

Billing And Recurring System is implemented as a Progressive Web App.

To be fast (confirmation within seconds), this system accepts stripe transactions.

. This application is built on ruby version 2.7


. Configure stripe into your application
  . Add your stripe public and secret keys into your secrets.yml file.

. Devise is configured in the config folder
  . Run $bundle install command to install gems

. Open the terminal and navigate to the directory where the project is placed
. Run the command: $rails db:migrate

. Open the terminal and navigate to the directory where the project is placed
. Run the command: $rails db:seed to have an admin user


. To start a local server, run rails s or $rails server into your terminal
