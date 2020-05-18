# to see the E/R Diagram, Database Schemas, Functional Dependencies, tables with data and SQL Queries, check the report.

CREATE TABLE Patients (
medicare INTEGER,
name VARCHAR(255),
PRIMARY KEY (medicare)
);

CREATE TABLE Dentists (
id INTEGER,
name VARCHAR(255),
clinic_name VARCHAR(255),
PRIMARY KEY (id),
FOREIGN KEY (clinic_name) REFERENCES Clinics(name)
);

# note: clinic_name was added as a field since it’s hard to know where the dentist works otherwise, it’s also less repetitive than 
# adding it in the appointments.

CREATE TABLE Clinics (
name VARCHAR(255),
PRIMARY KEY (name)
);

CREATE TABLE Appointments (
patient_medicare INTEGER,
dentist_id INTEGER,
date_time DATETIME,
a_id INTEGER AUTO_INCREMENT,
missed BOOLEAN, 
PRIMARY KEY (patient_medicare, dentist_id, date_time),
FOREIGN KEY (patient_medicare) REFERENCES Patients(medicare),
FOREIGN KEY (dentist_id) REFERENCES Dentists(id),
UNIQUE (a_id)
);

# note: a_id was made unique so it can be used as the primary key in treatments and bills.

CREATE TABLE Treatments (
a_id INTEGER,
name VARCHAR(255), 
price INTEGER,
PRIMARY KEY (a_id, name),
FOREIGN KEY (a_id) REFERENCES Appointments(a_id)
);

CREATE TABLE Bills (
a_id INTEGER,
paid BOOLEAN,
amount DECIMAL,
PRIMARY KEY (a_id),
FOREIGN KEY (a_id) REFERENCES Appointments(a_id)
);
