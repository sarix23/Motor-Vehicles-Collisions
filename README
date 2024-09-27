# Title: Motor Vehicle Collisions Analysis, New York City – 2018

# ----------------------------------------------------------------------------------------------------------
# Description of project
# ----------------------------------------------------------------------------------------------------------
Our project focuses on analysing vehicle collisions that occurred in New York City in 2018, 
with particular attention to the dynamics leading to the collisions, the involved parties, 
and the surrounding spatiotemporal conditions. To access this wide range of information, 
we integrated data from four different sources, each providing specific details on each collision, 
the involved vehicles and drivers, the meteorological conditions at the time of the collision, and 
the day of the week when it occurred.

Our research questions cover various aspects of the collisions:
A.	Observing the distribution of collisions across the five boroughs of New York City 
    (Brooklyn, Manhattan, Queens, Staten Island, Bronx).
B.	Analysing the severity of each collision by considering the number of injured and deceased 
    individuals involved.
C.	Examining the driver's license status of the involved drivers to determine if it may influence 
    the likelihood of a collision.
D.	Investigating the pre-collision dynamics to identify situations that may lead to collisions more 
    frequently.
E.	Evaluating which driving behaviours may increase the probability of a collision.
F.	Examining whether the number of passengers in the vehicle may contribute to the collision, 
    hypothesizing that they may distract the driver.
G.	Exploring the meteorological conditions in which collisions primarily occur.
H.	Verifying if there are certain days of the week or holidays when collisions occur more frequently, 
    and if there is a variation compared to the daily average.
I.	Analysing if there are specific moments of the day when there is a higher concentration of collisions.

How to execute the code: a simple guide. 
# ----------------------------------------------------------------------------------------------------------
# Datasets
# ----------------------------------------------------------------------------------------------------------
*Vehicles and Collisions*
    Both data sources were obtained through Python API querying from NYC Open Data. The following libraries 
    were used:

    - `pandas` for data management
    - `sodapy` for interacting with the Socrata API
    - `datetime` for handling dates and times
    - `json` for manipulating JSON data
    - `ReadTimeout` from `requests.exceptions` for handling request timeouts

    The API requires creating a user account and an app token. These operations can be performed by accessing the 
    user area of the API documentation available at this link (https://data.cityofnewyork.us/login). 
    Once logged into the personal area, follow these steps:

    1. Create a new user account.
    2. Log into the personal area.
    3. At the bottom of the page, select "Create New App Token."


*Weather*
    To reproduce this code, you need to:

    1. Install the following libraries:
    - `requests`
    - `BeautifulSoup` from `bs4`
    - `pandas`
    - `openmeteo_requests`
    - `requests_cache`
    - `retry` from `retry_requests`
    - `time`

    2. Next, download the dataset from the following link 
    (https://data.cityofnewyork.us/City-Government/Broadband-Adoption-and-Infrastructure-by-Zip-Code/qz5f-yx82/about_data) 
    by clicking on "Export" and selecting the CSV format.

*Calendar*
    To reproduce this code, you need to install the following libraries:
    - `requests`
    - `BeautifulSoup` from `bs4`
    - `pandas`
    - `datetime` from datetime


# ----------------------------------------------------------------------------------------------------------
# Data cleaning
# ----------------------------------------------------------------------------------------------------------
*Vehicles_Cleaning.ipynb*
    To reproduce this code, you need to install the following libraries:
        - `pandas` as `pd`
        - `numpy` as `np`

*Collisions_Cleaning.ipynb*
    To reproduce this code, you need to install the following libraries:
        - `geopy` and import `Nominatim` from `geopy.geocoders`
        - `pandas` as `pd`

*Weather_Cleaning.ipynb*
    To reproduce this code, you need to install the following library:
        - `pandas` as `pd`

# ----------------------------------------------------------------------------------------------------------
# Data storage
# ----------------------------------------------------------------------------------------------------------
To create the database:

1. Install `sqlite3` following the instructions at this link: (https://www.sqlite.org/download.html).
2. Once installed, open the terminal and execute the following commands:
   - `sqlite3 MCV.db` to create the database.
   - To view the database storage repository: `.databases ~/Desktop`.

3. Without closing the terminal, if not already installed, download and install `VsCode` from 
    (https://code.visualstudio.com/download). Then, in the Extensions section, install the 
    following extensions: "Database Client" and "dBizzy".

4. Following the instructions provided on the "Database Client" extension page 
    (https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-database-client2), load the 
    database created from the terminal.

5. Once loaded, execute the SQL code contained in the `data-storage.sql` file, which contains 
    the queries for creating the database structure. To execute the code:
    - Look for the "Active Connection" label in the upper right corner and click on it. 
    - A dropdown will appear showing any databases loaded in VSCode. 
    - Select the desired database to activate the connection. 
    - Now the code is ready to be executed.

6. To visualize the entity-relationship schema, follow the tutorial provided by the official dBizzy 
    extension page (https://marketplace.visualstudio.com/items?itemName=dBizzy.dbizzy).

7. Return to the terminal and enter the following sequence of commands to populate all the created tables:
   ```
   sqlite> .mode csv
   sqlite> .import -skip 1 file_path/file.csv TABLE_NAME
   ```
   where `file.csv` is the file containing a clean dataset, and `TABLE_NAME` is the name of the table to populate.

8. Finally, return to the terminal and type `.exit` to close the sqlite3 session.

# ----------------------------------------------------------------------------------------------------------
# Data integration 
# ----------------------------------------------------------------------------------------------------------
Note: within each SQL file, the following string is present: "-- Active: 1707688166984@@127.0.0.1@1433." 
To ensure that the code is executable within the created database, replace the connection identifier of 
the database you have created on your device with the one present in the file.
Once the `data-integration.sql` file is opened in VSCode:

1. Look for the "Active Connection" label in the upper right corner and click on it. 
2. A dropdown will appear showing any databases loaded in VSCode. 
3. Select the desired database to activate the connection. 
4. Now the code is ready to be executed.

# ----------------------------------------------------------------------------------------------------------
# Data quality
# ----------------------------------------------------------------------------------------------------------
Note: within each SQL file, the following string is present: "-- Active: 1707688166984@@127.0.0.1@1433." 
To ensure that the code is executable within the created database, replace the connection identifier of 
the database you have created on your device with the one present in the file.
Once the `data-quality.sql` file is opened in VSCode:

1. Look for the "Active Connection" label in the upper right corner and click on it. 
2. A dropdown will appear showing any databases loaded in VSCode. 
3. Select the desired database to activate the connection. 
4. Now the code is ready to be executed.

# ----------------------------------------------------------------------------------------------------------
# Data querying
# ----------------------------------------------------------------------------------------------------------
Note: within each SQL file, the following string is present: "-- Active: 1707688166984@@127.0.0.1@1433." 
To ensure that the code is executable within the created database, replace the connection identifier of 
the database you have created on your device with the one present in the file.
Once the `data-querying.sql` file is opened in VSCode:

1. Look for the "Active Connection" label in the upper right corner and click on it. 
2. A dropdown will appear showing any databases loaded in VSCode. 
3. Select the desired database to activate the connection. 
4. Now the code is ready to be executed.


# ----------------------------------------------------------------------------------------------------------
# Authors
# ----------------------------------------------------------------------------------------------------------
Giulia Saresini
Sara Nava
