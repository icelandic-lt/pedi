# Pedi - A Pronunciation Dictionary Editor

Pedi is a web application to read, edit and export pronunciation dictionaries. 

## Features of the Prototype

### Import SAMPA list

A SAMPA list can be imported into the web application. You can find a sample list inside the sample-data/ sub directory.

### Import 2-column CSV text files as pronunciation dictionaries

A dictionary is made up of CSV formatted text and has the following format:

|  **WORD** | **SAMPA PRONUNCIATION**  |
|---|---|
|   bera |  b E: r a |
|   pera |  p E: r a |
|   dalur |  d a: l Y r |
|   ... |  ... |

When importing, the name of the dictionary is set by the user.
The import functionality saves the dictionary into an internal database table.


### Show overview of dictionaries

Imported dictionaries are shown in a list view with basic statistics like:

- number of entries


### Show and edit contents of a dictionary

An imported dictionary is organized as list of entries:
- Word
- SAMPA pronunciation
- Comment

Entries are shown paginated if they don't fit on a page.

#### Incorrect phonetic transcriptions

If a transcription of an entry is incorrect, there appears a colored yellow marking of
the incorrect transcription. A violation of the following rules are therefore marked as incorrect:

- All SAMPA pronunciation symbols have to be separated by a space
- All symbols have to be part of the well defined SAMPA symbol set


#### Editing

It is possible to edit the following attributes of a dictionary entry:

- Word
- SAMPA pronunciation
- Comment

### Database schema

The internal database schema is as follows:

#### Dictionary

- Dictionary name
- Date & time created
- Date & time last edited (via :updated_at)
- A correlated Sampa list for Sampa syntax checking
 
#### Entry

- Word
- SAMPA pronunciation
- Comment
- User id (created / changed)
- Modification date/time (created / changed)

#### User

- Name
- Password
- EMail

### Export SAMPA  dictionaries as 2-column CSV text files

Every dictionary can be exported to a local file on disk with the same CSV format as described in the import section.
The dictionary name is preset as local file name.

### User Authentication

There is a basic user authentication to access the web application. All users share the same rights. Default user and password is admin@example.com/admin_password.

## Getting started

First make sure to have Ruby installed. Afterwards, run `bundle` in the root directory. Then follow these steps:

```bash
rails db:create
rails db:migrate
rails db:seed
rails server
````

The seed data should be enough to give you an idea how this appliction works.

After finishing the above steps, you should be able to access the web application on [localhost:3000](http://localhost:3000)

## Trouble shooting

This is a prototype application. It is still in heavy development. If you encounter any errors, we are glad if you file an issue on the issue tracker or contact us at info@grammatek.com.
