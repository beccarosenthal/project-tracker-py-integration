"""Hackbright Project Tracker.

A front-end for a database that allows users to work with students, class
projects, and the grades students receive in class projects.
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
db = SQLAlchemy()


def connect_to_db(app):
    """Connect the database to our Flask app."""

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///hackbright'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


def get_student_by_github(github):
    """Given a GitHub account name, print info about the matching student."""

    QUERY = """
        SELECT first_name, last_name, github
        FROM students
        WHERE github = :github
        """
        #db cursor is a query object, which is sort of an object. :github is sanitizing
        #the user input from the terminal to make sure it will work
    db_cursor = db.session.execute(QUERY, {'github': github})

    row = db_cursor.fetchone()

    print "Student: {first} {last}\nGitHub account: {acct}".format(
        first=row[0], last=row[1], acct=row[2])


def make_new_student(first_name, last_name, github):
    """Add a new student and print confirmation.

    Given a first name, last name, and GitHub account, add student to the
    database and print a confirmation message.
    """
#note variable names to see what is corrilated with what
    QUERY = """
        INSERT INTO students (first_name, last_name, github)
        VALUES (:fname, :lname, :ghub)
        """
    #parameter substitution happens below.
    db.session.execute(QUERY, {'fname': first_name,
                               'lname': last_name,
                               'ghub': github})
    db.session.commit()

    print "Successfully added student: {first} {last}".format(
        first=first_name, last=last_name)


def get_project_by_title(title):
    """Given a project title, print information about the project."""
    
    QUERY = """SELECT * FROM projects where title = :ttl"""

    db_cursor = db.session.execute(QUERY, {'ttl': title})

    row = db_cursor.fetchone()

    import pdb; pdb.set_trace()

    print """Project: Title: {ttl}
    ID: {id}
    Description: {description}
    Max Grade: {maxgr}""".format(ttl=row[1],
                                 id=row[0],
                                 description=row[2],
                                 maxgr=row[3])


def get_grade_by_github_title(github, title):
    """Print grade student received for a project."""
    pass


def assign_grade(github, title, grade):
    """Assign a student a grade on an assignment and print a confirmation."""
    pass


def handle_input():
    """Main loop.

    Repeatedly prompt for commands, performing them, until 'quit' is received as a
    command."""

    command = None

    # could go through here and error check input...come back to it
    while command != "quit":
        input_string = raw_input("HBA Database> ")
        tokens = input_string.split()
        command = tokens[0]
        args = tokens[1:]

        if command == "student":
            github = args[0]
            get_student_by_github(github)

        elif command == "new_student":
            try:
                first_name, last_name, github = args  # unpack!
            except:
                print "invalid. Try again."
                continue
            make_new_student(first_name, last_name, github)

        elif command == "project":
            project = " ".join(args)
            get_project_by_title(project)

        else:
            if command != "quit":
                print "Invalid Entry. Try again."


if __name__ == "__main__":
    connect_to_db(app)

    handle_input()

    # To be tidy, we close our database connection -- though,
    # since this is where our program ends, we'd quit anyway.

    db.session.close()
