/*This is the Hospital Database Grouped by DDL and DML and further by the specific type of DDL or DML*/
CREATE DATABASE TheMicroSoftHospital
GO

use TheMicroSoftHospital
GO

-- //////////////////////////////////////////////////////////////////////////////////////////////////// --
  /*Creates ALL The Tables and adds their corresponding Primary Keys*/

Create table Doctor(DEmployee_ID smallint NOT NULL,
CONSTRAINT pk_DEmployee_ID PRIMARY KEY (DEmployee_ID),  
NEmployee_ID smallint, 
Doctor_Specialty tinyint NOT NULL,
Salary Decimal (9,2) NOT NULL,
Employee_ID smallint NOT NULL)
GO

CREATE TABLE Nurse(NEmployee_ID smallint NOT NULL, 
constraint pk_NEmployee_ID Primary key (NEmployee_ID),
Nurse_Specialty tinyint NOT NULL,
Wage  decimal(4,2) NOT NULL,
Employee_ID smallint NOT NULL)
GO

CREATE TABLE Registration(REmployee_ID smallint NOT NULL,
constraint pk_REmployee_ID Primary key (REmployee_ID),
Wage decimal(4,2) NOT NULL,
Employee_ID smallint NOT NULL)
GO

Create Table Treatment(Treatment_ID smallint NOT NULL,
constraint pk_Treatment_ID primary key(Treatment_ID),
Patient_ID smallint NOT NULL,
DEmployee_ID smallint NOT NULL,
Date_ date NOT NULL,
Medicine_ID NCHAR(5),
Treatment_Type tinyint NOT NULL,
Appointment_ID smallint NOT NULL)
GO

Create Table Treatment_Diagnosis(Treatment_ID smallint NOT NULL,
constraint pk_Treatment_Diagnosis_ID primary key (Treatment_ID, Diagnosis),
Diagnosis tinyint NOT NULL)
GO

Create Table Discharge(Discharge_ID smallint NOT NULL, 
constraint pk_Discharge_ID primary key (Discharge_ID),
Patient_ID smallint NOT NULL, 
Date_ Date NOT NULL)
GO

Create Table Patient(Patient_ID smallint NOT NULL,
constraint pk_Patient_ID primary key (Patient_ID),
Hospital_ID smallint NOT NULL,
First_Name NVARCHAR(20) NOT NULL,
Last_Name NVARCHAR(20) NOT NULL,
Admission_Date Date NOT NULL,
Patient_Type NCHAR(1) NOT NULL)
GO

Create Table Outpatient(Opatient_ID smallint NOT NULL,
constraint pk_Opatient_ID primary key(Opatient_ID),
Bill_ID smallint NOT NULL)
GO

Create Table Resident_Patient(RPatient_ID smallint NOT NULL,
constraint pk_Rpatient_ID primary key(Rpatient_ID),
Room_ID smallint NOT NULL,
Appointment_ID smallint NOT NULL)
GO

Create Table Appointment(Appointment_ID smallint NOT NULL,
constraint pk_Appointment_ID primary key(Appointment_ID),
REmployee_ID smallint NOT NULL,
Date_ DATE NOT NULL)
GO

Create Table Bill(Bill_ID smallint NOT NULL,
constraint pk_Bill_ID primary key(Bill_ID),
REmployee_ID smallint NOT NULL,
Insruance_ID smallint NOT NULL)
GO

CREATE TABLE Medical_Record(Record_ID smallint NOT NULL,
constraint pk_Record_ID primary key(Record_ID),
Patient_ID smallint NOT NULL,
REmployee_ID smallint NOT NULL,
NEmployee_ID smallint NOT NULL)
GO

Create Table Medical_Record_Medications(Record_ID smallint NOT NULL,
constraint pk_MRM primary key(Record_ID, Medicine_ID),
Medicine_ID NChar(5) NOT NULL)
GO

Create Table Medical_Record_Allergies(Record_ID smallint NOT NULL,
constraint pk_MRA primary key(Record_ID, Allergy),
Allergy tinyint NOT NULL)
GO

Create Table Medical_Record_Past_Diagnosis(Record_ID smallint NOT NULL,
constraint pk_MRPD primary key (Record_ID, Diagnosis),
Diagnosis tinyint NOT NULL,
Date_ date NOT NULL)
GO

Create Table Triage(Triage_ID smallint NOT NULL,
constraint pk_Triage_ID primary key(Triage_ID),
NEmployee_ID smallint NOT NULL,
Patient_ID smallint Not NULL,
Severity Tinyint NOT NULL,
Date_ date NOT NULL,
Medicine_ID NCHAR(5),
Triage_Type tinyint NOT NULL)
GO

Create Table Room(Room_ID smallint NOT NULL,
constraint pk_Room_ID primary key(Room_ID),
Room_Type NVARCHAR(30) NOT NULL)
GO

Create Table Supplier(Supplier_ID smallint NOT NULL,
constraint pk_Supplier_ID primary key(Supplier_ID),
Supplier_Name NVARCHAR(30) NOT NULL,
Supplier_Address NVARCHAR(50) NOT NULL)
GO

Create Table Order_ (Order_ID smallint NOT NULL,
constraint pk_Order_ID primary key(Order_ID),
Supplier_ID smallint NOT NULL,
Hospital_ID smallint NOT NULL,
Order_Date date NOT NULL)
GO

Create Table Order_Line(Order_ID smallint NOT NULL,
constraint pk_OL primary key(Order_ID, Supplier_ID),
Supplier_ID smallint NOT NULL,
Quantity smallint NOT NULL)
GO

Create Table Hospital(Hospital_ID smallint NOT NULL,
constraint pk_Hospital_ID primary key(Hospital_ID),
Hospital_Name NVARCHAR(30) NOT NULL,
Hospital_Address NVARCHAR(30) NOT NULL)
GO

Create Table Medicine(Medicine_ID NChar(5) NOT NULL,
constraint pk_Medicine_ID primary key(Medicine_ID),
Hospital_ID smallint NOT NULL,
Quantity smallint NOT NULL,
Expiration date NOT NULL)
GO

Create Table Employee(Employee_ID smallint NOT NULL,
constraint pk_Employee_ID primary key(Employee_ID),
Hospital_ID smallint NOT NULL,
First_Name NVARCHAR(20) NOT NULL,
Last_Name NVARCHAR(20) NOT NULL,
DOB date NOT NULL,
Date_Hired date NOT NULL,
Employee_Type NChar(1) NOT NULL,
Clearance_Level tinyint NOT NULL)
GO

Create Table Nurse_Specialty_Lookup(Code_ tinyint NOT NULL,
constraint pk_NS_Lookup primary key(Code_),
Value_ NVARCHAR(30) NOT NULL)
GO

Create Table Doctor_Specialty_Lookup(Code_ tinyint NOT NULL,
constraint pk_DS_Lookup primary key(Code_),
Value_ NVARCHAR(30) NOT NULL)
GO

Create Table Treatment_Type_Lookup(Code_ tinyint NOT NULL,
constraint pk_Treatment_Lookup primary key(Code_),
Value_ NVARCHAR(50) NOT NULL)
GO

Create Table Triage_Type_Lookup(Code_ tinyint NOT NULL,
constraint pk_TT_Lookup primary key(Code_),
Value_ NVARCHAR(30) NOT NULL)
GO

Create Table Severity_Lookup (Code_ tinyint NOT NULL,
constraint pk_Severity_Lookup primary key(Code_),
Value_ NVARCHAR(30) NOT NULL)
GO

Create Table Diagnosis_Lookup(Code_ tinyint NOT NULL,
constraint pk_Diagnosis_Lookup primary key(Code_),
Value_ NVARCHAR(50) NOT NULL)
GO

Create Table Allergy_Lookup(Code_ tinyint NOT NULL,
constraint pk_Allergy_Lookup primary key(Code_),
Value_ NVARCHAR(30) NOT NULL)
GO

Create Table Employee_Type_Lookup(Code_ NChar(1) NOT NULL,
constraint pk_ET_Lookup primary key(Code_),
Value_ NVARCHAR(30) NOT NULL)
GO

Create Table Clearance_Lookup(Code_ tinyint NOT NULL,
constraint pk_Clearance_Lookup primary key(Code_),
Value_ NVARCHAR(30) NOT NULL)
GO

    /*End of Creating All Tables*/
-- //////////////////////////////////////////////////////////////////////////////////////////////////// --

-- //////////////////////////////////////////////////////////////////////////////////////////////////// --
  /*Adds ALL the foreign key constraints with their references*/

Alter table Nurse add constraint fk_Nurse_Specialty_Lookup foreign key(Nurse_Specialty) references Nurse_Specialty_Lookup(Code_)
GO
Alter Table Nurse Add constraint fk_Nurse_Employee_ID foreign key(Employee_ID) references Employee(Employee_ID)
GO

Alter Table Registration Add constraint fk_Registration_Employee_ID foreign key(Employee_ID) references Employee(Employee_ID)
GO

ALTER table Doctor add constraint fk_Doctor_ID_NEmployee_ID foreign key(NEmployee_ID) references Nurse(NEmployee_ID)
GO
ALTER table Doctor add constraint fk_Doctor_Specialty_Lookup foreign key(Doctor_Specialty) references Doctor_Specialty_Lookup(code_)
GO
Alter Table Doctor Add constraint fk_Doctor_Employee_ID foreign key(Employee_ID) references Employee(Employee_ID)
GO

ALTER table Treatment add constraint fk_Patient_ID_Treatment_ID foreign key(Patient_ID) references Patient(Patient_ID)
GO
ALTER table Treatment add constraint fk_DEmployee_ID_Treatment_Table_ID foreign key(DEmployee_ID) references Doctor(DEmployee_ID)
GO
ALTER table Treatment add constraint fk_Treatment_Type_Lookup foreign key(Treatment_Type) references Treatment_Type_Lookup(code_)
GO


ALTER table Treatment_Diagnosis add constraint fk_TD_Treatment_ID foreign key(Treatment_ID) references Treatment(Treatment_ID)
GO
ALTER table Treatment_Diagnosis add constraint fk_Diagnosis_Lookup foreign key(Diagnosis) references Diagnosis_Lookup(Code_)
GO


ALTER table Discharge add constraint fk_Discharge_Patient_ID foreign key(Patient_ID) references Patient(Patient_ID)
GO


ALTER table Patient add constraint fk_Hospital_ID foreign key(Hospital_ID) references Hospital(Hospital_ID)
GO


ALTER table Outpatient add constraint fk_Bill_ID foreign key(Bill_ID) references Bill(Bill_ID)
GO


ALTER table Resident_Patient add constraint fk_room_ID foreign key(Room_ID) references Room(Room_ID)
GO
ALTER table Resident_Patient add constraint fk_RP_Appointment_ID foreign key(Appointment_ID) references Appointment(Appointment_ID)
GO

ALTER table Appointment add constraint fk_Appointment_REmployee_ID foreign key(REmployee_ID) references Registration(REmployee_ID)
GO

ALTER table Bill add constraint fk_Bill_REmployee_ID foreign key(REmployee_ID) references Registration(REmployee_ID)
GO

ALTER table Medical_Record add constraint fk_MR_Patient_ID foreign key(Patient_ID) references Patient(Patient_ID)
GO
ALTER table Medical_Record add constraint fk_MR_REmployee_ID foreign key(REmployee_ID) references Registration(REmployee_ID)
GO
ALTER table Medical_Record add constraint fk_MR_NEmployee_ID foreign key(NEmployee_ID) references Nurse(NEmployee_ID)
GO


ALTER table Medical_Record_Medications add constraint fk_MRM_Record_ID foreign key(Record_ID) references Medical_Record(Record_ID)
GO
ALTER table Medical_Record_Medications add constraint fk_MRM_Medicine_ID foreign key(Medicine_ID) references Medicine(Medicine_ID)
GO

ALTER table Medical_Record_Allergies add constraint fk_MRA_Record_ID foreign key(Record_ID) references Medical_Record(Record_ID)
GO
ALTER table Medical_Record_Allergies add constraint fk_Allergy_Lookup foreign key(Allergy) references Allergy_Lookup(code_)
GO


ALTER table Medical_Record_Past_Diagnosis add constraint fk_MR_PD_Record_ID foreign key(Record_ID) references Medical_Record(Record_ID)
GO
ALTER table Medical_Record_Past_Diagnosis add constraint fk_MR_Diagnosis_Lookup foreign key(Diagnosis) references Diagnosis_Lookup(Code_)
GO



ALTER table Triage add constraint fk_Triage_NEmployee_ID foreign key(NEmployee_ID) references Nurse(NEmployee_ID)
GO
ALTER table Triage add constraint fk_Triage_Patient_ID foreign key(Patient_ID) references Patient(Patient_ID)
GO
ALTER table Triage add constraint fk_Triage_Type_Lookup foreign key(Triage_Type) references Triage_Type_Lookup(Code_)
GO
ALTER table Triage add constraint fk_Severity_Lookup foreign key(Severity) references Severity_Lookup(Code_)
GO




ALTER table Order_ add constraint fk_Order_Supplier_ID foreign key(Supplier_ID) references Supplier(Supplier_ID)
GO
ALTER table Order_ add constraint fk_Order_Hospital_ID foreign key(Hospital_ID) references Hospital(Hospital_ID)
GO

ALTER table Order_Line add constraint fk_OL_Order_ID foreign key(Order_ID) references Order_(Order_ID)
GO
ALTER table Order_Line add constraint fk_OL_Supplier_ID foreign key(Supplier_ID) references Supplier(Supplier_ID)
GO

ALTER table Medicine add constraint fk_Medicine_Hospital_ID foreign key(Hospital_ID) references Hospital(Hospital_ID)
GO

ALTER table Employee add constraint fk_Employee_Hospital_ID foreign key(Hospital_ID) references Hospital(Hospital_ID)
GO
ALTER table Employee add constraint fk_Employee_Type_Lookup foreign key(Employee_Type) references Employee_Type_Lookup(code_)
GO
ALTER table Employee add constraint fk_Employee_Clearance_Lookup foreign key(Clearance_Level) references Clearance_Lookup(code_)
GO


    /*End of ALL the foreign key constraints with their references*/
-- //////////////////////////////////////////////////////////////////////////////////////////////////// --

-- //////////////////////////////////////////////////////////////////////////////////////////////////// --
  /*Creation of ALL Indexes */

/*This index promotes queries for Doctor Specialties in the case that a patient needs to be looked at by a specific Doctor */
CREATE INDEX Doctor_Type
ON Doctor(Doctor_Specialty)
GO

/*This index promotes queries for Nurse Specialties in the case that upon arrival to the Hospital the correct nurse is paged */ 
Create Index Nurse_Type
ON Nurse(Nurse_Specialty)
GO

/*This index promotes queries for Diagnosis Type in the case that Patients must be found in accordance to the Diagnosis they have recieved presently */
Create Index Treatment_Diagnosis_Type
On Treatment_Diagnosis(Diagnosis)
GO

/*This index promotes queries for Allergy in the case that patients must be found in acoordance to who is allergic to what to prevent cross contamination */
Create Index Allergy
ON Medical_Record_Allergies(Allergy)
GO

/*This index promotes queries for Past_Diagnosis in  that Patients must be found in accordance to the Diagnosis they have recieved in the past to rule out possibilities by doctors */
Create Index Past_Diagnosis
ON Medical_Record_Past_Diagnosis(Diagnosis)
GO

/*This index promotes queries for Severity so that patients with high severity may be easily found*/
Create Index Severity
On Triage(Severity)
GO

/*This index promotes queries for Triage_Type so that patients who have undergone serious triage are givin a higher priority as to give them life saving care*/
Create Index Triage_Type
ON Triage(Triage_Type)
GO

/*This index promotes queries for Employee Type so that employees of a certain type may easily be found*/
Create Index Employee_Type
On Employee(Employee_Type)
GO

/*This index promotes queries for Clearance Level so that Employees*/
Create Index Clearance_Level
ON Employee(Clearance_Level)
GO

   /*End of Creation of ALL Indexes */
-- //////////////////////////////////////////////////////////////////////////////////////////////////// --

-- //////////////////////////////////////////////////////////////////////////////////////////////////// --
  /*Population of All Tables*/

INSERT Hospital (Hospital_ID, Hospital_Name, Hospital_Address)
VALUES (1, 'ST. Ravanshad', '255 Hope Lane')
GO
INSERT Hospital (Hospital_ID, Hospital_Name, Hospital_Address)
VALUES (2, 'St. Logan', '100 Cracked Ave.')
GO
INSERT Hospital (Hospital_ID, Hospital_Name, Hospital_Address)
VALUES (3, 'ST. Neo', '550 TrustNoOne Ave.')
GO
INSERT Hospital (Hospital_ID, Hospital_Name, Hospital_Address)
VALUES (4, 'ST. Tulio', '365 RedBullSponser Ave,')
GO


INSERT employee_type_lookup(Code_, Value_)
VALUES('D', 'Doctor'),
('N', 'Nurse'),
('R', 'Registration')
GO

Insert Clearance_Lookup(Code_, Value_)
Values(1, 'No Access'),
(2, 'Access To the Hospital'),
(3, 'Medical Records'),
(4, 'Medical Records and Medicine'),
(5, 'Full Access')
GO


Insert Room(Room_ID, Room_Type)
VALUES(1, 'Emergency Room')
GO
Insert Room(Room_ID, Room_Type)
VALUES(2, 'Waiting Room')
GO
Insert Room(Room_ID, Room_Type)
VALUES(3, 'Pysch Ward')
GO
Insert Room(Room_ID, Room_Type)
VALUES(4, 'Burn Unit')
GO
Insert Room(Room_ID, Room_Type)
VALUES(5, 'Burn Unit')
GO


Insert Supplier(Supplier_ID, Supplier_Name, Supplier_address)
Values(1, 'Limited Tools', '150 Beacon Boulevard')
GO
Insert Supplier(Supplier_ID, Supplier_Name, Supplier_address)
Values(2, 'Cartoon Suppliers', '3000 Hurd Avenue')
GO
Insert Supplier(Supplier_ID, Supplier_Name, Supplier_address)
Values(3, 'Corbin Medicine', '150 Family Guy Boulevard')
GO
Insert Supplier(Supplier_ID, Supplier_Name, Supplier_address)
Values(4, 'Connecticut Arms', '300 Golden Road')
GO
Insert Supplier(Supplier_ID, Supplier_Name, Supplier_address)
Values(5, 'Unlimited Tools', '999 Beer Avenue')
GO





INSERT patient (Patient_ID, Hospital_ID, First_Name, Last_Name, Admission_Date, Patient_Type)
VALUES (2,1,'Neo','Wired','2005-11-10','O')
GO


INSERT patient (Patient_ID, Hospital_ID, First_Name, Last_Name, Admission_Date, Patient_Type)
VALUES (3,1,'Logan','Kavjeski','2005-08-01','N')
GO

INSERT patient (Patient_ID, Hospital_ID, First_Name, Last_Name, Admission_Date, Patient_Type)
VALUES (4,1,'Kimberly','Philins','2005-07-04','P')
GO
INSERT patient (Patient_ID, Hospital_ID, First_Name, Last_Name, Admission_Date, Patient_Type)
VALUES (1,1,'bob','lee','2005-10-01','N')
GO



Insert Employee(Employee_ID, Hospital_ID, First_Name, Last_Name, DOB, Date_Hired, Employee_Type, Clearance_Level)
VALUES(10000, 1, 'Gram', 'Johnson', '1960-10-20', '2000-8-8','D',4),
(10001, 1,'Joe','Shmoe', '1978-10-29','1999-7-10','D', 4),
(10002, 1,'Guy','Slash', '1989-6-12','2007-10-20','N',3)
GO

Insert Employee(Employee_ID, Hospital_ID, First_Name, Last_Name, DOB, Date_Hired, Employee_Type, Clearance_Level)
Values(10004,1,'Megan','Lambert', '1986-6-10','2010-10-10','N', 3),
(10005,1,'Casey','Jones', '1955-6-10','1978-3-10','N', 3),
(10006,1,'Joe','Barlow', '1980-6-10','2007-10-10','N', 3)
GO

Insert Employee(Employee_ID, Hospital_ID, First_Name, Last_Name, DOB, Date_Hired, Employee_Type, Clearance_Level)
Values(10007,1,'Megan','Brown', '1986-6-10','2010-10-10','N', 3),
(10008,1,'Mary','Jones', '1960-6-10','1978-3-10','N', 3),
(10009,1,'Johnson','Barlow', '1988-6-10','2007-10-10','N', 3)
GO

Insert Employee(Employee_ID, Hospital_ID, First_Name, Last_Name, DOB, Date_Hired, Employee_Type, Clearance_Level)
Values(10010,1,'Rich','Flamu', '1980-6-10','2010-10-10','D', 4),
(10011,1,'Jerry','Gomez', '1966-6-10','1989-3-10','D', 4),
(10012,1,'Jose','Paper', '1970-6-10','2007-10-10','D', 4)
GO

Insert Employee(Employee_ID, Hospital_ID, First_Name, Last_Name, DOB, Date_Hired, Employee_Type, Clearance_Level)
Values(10013,1,'Gupe','Faanu', '1988-6-10','2010-10-10','R', 2),
(10014,1,'Jerry','Ghoen', '1967-6-10','1989-3-10','R', 2),
(10015,1,'Jose','Chip', '1975-6-10','2007-10-10','R', 2)
GO




Insert Nurse_Specialty_Lookup(Code_, Value_)
Values(0,'RN Nurse'),
(1, 'Cardiac Nurse'),
(2,'CRNA'),
(3,'CNS'),
(4, 'ER Nurse'),
(5, 'Perioperative'),
(6,'Nurse Midwife'),
(7, 'Oncology'),
(8, 'Pediatric Nurse'),
(9, 'Orthopedic')
GO

Insert Doctor_Specialty_Lookup(Code_, Value_)
Values(0, 'Allergist'),
(1,'Anesthesiologist'),
(2, 'Cardiologists'),
(3, 'General Surgeon'),
(4, 'Gastroenterologist'),
(5, 'Neurologist'),
(6, 'Oncologist'),
(7, 'Pediatrican'),
(8, 'Physiatrist'),
(9, 'Psychiatrist')
GO

Insert Treatment_Type_Lookup(Code_, Value_)
Values(0, 'Allergy(Ashma)'),
(1, 'Anticoagulation'),
(2, 'Bariatric Surgery'),
(3, 'Hematology'),
(4, 'Allergy(Ashma)'),
(5, 'Cardiac Rehabilitation'),
(6, 'Cardiac Surgery'),
(7, 'Allergy(Ashma)'),
(8, 'Cosmetic Services'),
(9, 'Critical Care'),
(10, 'Allergy(Ashma)')
GO

Insert Triage_Type_Lookup(Code_, Value_)
Values(0, 'Resuscitation'),
(1, 'Bandaging'),
(2, 'Tourniquet'),
(3, 'Vitals'),
(4, 'Physical Examination')
GO

Insert Severity_Lookup(Code_, Value_)
Values(1,'Immediate Attention'),
(2, 'Needs Attention'),
(3, 'Moderate Danger'),
(4,'Discomfort'),
(5,'No Danger')
GO

Insert Diagnosis_Lookup(Code_, Value_)
Values(0,'Abdominal Aneruysm'),
(1,'Acne'),
(2,'Acute Cholecytitis'),
(3,'Peripheral Neuropathy'),
(4,'Personality Disorder'),
(5,'Pleurisy'),
(6,'Pneumonia'),
(7,'PCOS'),
(8,'Polymalgia Rheumatica'),
(9,'Post-Polio'),
(10,'PTSD'),
(11,'Postnatal Depression'),
(12,'Pregnancy'),
(13,'Pressure Ulcers'),
(14,'Cancer'),
(15,'Psoriasiss'),
(16,'Psoriatic Arthritis'),
(17,'Psychosis'),
(18,'Pubic Lice'),
(19,'Rare Tumors'),
(20,'Raynauds Phenomenon'),
(21,'Reactive Arthritis'),
(22,'Restless Legs Syndrome'),
(23,'Retinoblastoma'),
(24,'Rhabdomyosar'),
(25,'Rheumatoid'),
(26,'Ringworm'),
(27,'Hives'),
(28,'Hemorrhage'),
(29,'Vaginal Discharge'),
(30,'Varicose Eczema'),
(31,'Venous Leg Ulcer'),
(32,'Vertigo'),
(33,'Vitamin Deficiency'),
(34,'Vomiting'),
(35,'Vulvar Cancer'),
(36,'Warts and Verrucas'),
(37,'Whooping Cough'),
(38,'Wilms Tumor'),
(39,'Bone Cancer'),
(40,'Yellow Fever')
GO



Insert Allergy_Lookup (Code_, Value_)
Values(0,'Pollen'),
(1,'Latex'),
(2,'Mold'),
(3,'Insulin'),
(4,'Penicillin'),
(5,'NSAIDS'),
(6, 'Sulfa')
GO


Insert Nurse(NEmployee_ID, Nurse_Specialty,Wage,Employee_ID)
Values(10002, 1, 15.20,10002)
GO

Insert Nurse(NEmployee_ID, Nurse_Specialty,Wage,Employee_ID)
Values(10004, 1, 15.20,10004),
(10005, 1, 15.20,10005),
(10006, 1, 15.20,10006)
GO

Insert Nurse(NEmployee_ID, Nurse_Specialty,Wage,Employee_ID)
Values(10007, 5, 15.20,10004),
(10008, 3, 15.20,10005),
(10009, 2, 15.20,10006)
GO

Insert Doctor(DEmployee_ID, NEmployee_ID, Doctor_Specialty, Salary, Employee_ID)
Values(10000,10004, 4, 100000.00, 10000),
(10001, 10004, 5, 150000.00, 10001),
(10010,10002,6, 132000.00, 10010),
(10011,10002,6, 132000.00, 10011),
(10012,10004,9, 160000.00, 10012)
GO

INSERT INTO Medicine (Medicine_ID, Hospital_ID, Quantity, Expiration)
VALUES
  ('ABC01', 1, 50, '2023-12-31'),
  ('DEF02', 1, 30, '2023-11-15'),
  ('GHI03', 1, 20, '2024-01-10'),
  ('JKL04', 1, 40, '2023-12-05'),
  ('MNO05', 1, 25, '2023-11-30'),
  ('PQR06', 1, 35, '2023-12-20'),
  ('STU07', 1, 15, '2023-12-25'),
  ('VWX08', 1, 60, '2024-02-05'),
  ('YZA09', 1, 45, '2024-01-15'),
  ('BCD10', 1, 55, '2023-11-10')
GO
  
INSERT INTO Patient (Patient_ID, Hospital_ID, First_Name, Last_Name, Admission_Date, Patient_Type)
VALUES
  (10000, 1, 'John', 'Doe', '2023-01-05', 'R'),
  (10001, 1, 'Jane', 'Smith', '2023-02-10', 'O'),
  (10002, 1, 'Alice', 'Johnson', '2023-03-15', 'R'),
  (10003, 1, 'Bob', 'Williams', '2023-04-20', 'O'),
  (10004, 1, 'Eva', 'Brown', '2023-05-25', 'R'),
  (10005, 1, 'David', 'Miller', '2023-06-30', 'O'),
  (10006, 1, 'Grace', 'Taylor', '2023-07-05', 'R'),
  (10007, 1, 'Sam', 'Jones', '2023-08-10', 'O'),
  (10008, 1, 'Linda', 'Anderson', '2023-09-15', 'R'),
  (10009, 1, 'Michael', 'Clark', '2023-10-20', 'O')
GO
  
Insert Registration(REmployee_ID,Wage,Employee_ID)
Values(10013,10.50,10013),
(10014,12.50,10014),
(10015,10.70,10015)
GO

Insert Medical_Record(Record_ID, Patient_ID,REmployee_ID,NEmployee_ID)
Values(10000,10000,10013,10005),
(10001,10001,10013,10005),
(10002,10002,10013,10005),
(10003,10003,10013,10005),
(10004,10004,10013,10005),
(10005,10005,10013,10005),
(10006,10006,10013,10005),
(10007,10007,10013,10005),
(10008,10008,10013,10005),
(10009,10009,10013,10005)
GO

Insert Medical_Record_Allergies(Record_ID, Allergy)
Values(10000,2),
(10000,4),
(10000,3),
(10002,1),
(10002,2),
(10002,3),
(10007,3),
(10007,5),
(10007,0),
(10004,6),
(10004,1),
(10004,3),
(10004,0)
Go
    /*END OF Population of All Tables*/
-- //////////////////////////////////////////////////////////////////////////////////////////////////// --


-- //////////////////////////////////////////////////////////////////////////////////////////////////// --
  /* Creation Of Views */
  
/*The first view was made to help identify
 only “burn unit“ rooms  in the hospital.*/
Create View "Burn_Units" 
AS
Select Room_ID AS "Room Descending", Room_Type AS "Room type"
From Room
Where Room_Type = ('Burn Unit')
Go


/*The second view was made to help identify hospital supplier 
names that started with the letter “C” */
Create View "Companies_Beginning_With_A_C"
AS
SELECT Supplier_Name AS "Company Name", Supplier_Address as "Company Address"
From Supplier
where supplier_name Like 'C%'
go


/*The third view was made to help identify
 the different room types in the hospital*/
 Create View "different_rooms"
AS
Select Room_ID AS "Room Descending", Room_Type AS "Different types of rooms"
From Room
GO


/*The fourth view was made to help identify 
the doctor employees in the hospital*/
Create View "Employees_Doctors"
as
select First_Name as "First Name", Last_Name as "Last Name", Employee_Type as "Job:"
From Employee
Where Employee_Type = 'D'
GO


/*The fifth view was made to help identify outpatients.*/
CREATE VIEW "Patient_Types_Letter"
AS
SELECT Patient_ID AS "Patient ID Number", Hospital_ID, First_Name, Last_Name, Admission_Date, Patient_type
FROM patient
WHERE Patient_Type = 'O';
GO


/*The sixth view was made to help identify all suppliers names in alphabetical order. */
CREATE VIEW Supplier_alphabetical_order
AS
SELECT Supplier_name AS "Company Name", Supplier_address AS "Comapny Address"
FROM supplier
GO

/*The seventh view  was made to help identify address information for hospital name “ST.Neo”.*/
CREATE VIEW "Where_is_neo_hospital_located"
AS
SELECT Hospital_name AS "Hospital Name", Hospital_address AS "Hospital Address Information"
FROM hospital
WHERE Hospital_name = 'ST. Neo'
GO
    /* END OF Creation Of Views */
-- //////////////////////////////////////////////////////////////////////////////////////////////////// --


-- //////////////////////////////////////////////////////////////////////////////////////////////////// --
/* Beginning of Single Table Queries */


/* - DISPLAY employee DOB, first name, and last name, whose date of birth is greater 1960 or less than 1980.
- Display employee clearance level.
- Sort the clearance level in descending order.*/
SELECT First_name, Last_name, Clearance_Level, DOB
FROM employee
WHERE (DOB >= '1960-01-01' AND DOB <= '1980-01-01')
ORDER BY Clearance_Level DESC
GO


/*-DISPLAY patient ID number 
-DISPLAY patient type and patient first name
-DISPLAY patient last name
-Find patients whose last name end with the letter e*/
SELECT Patient_ID, Patient_Type, First_Name, Last_Name
FROM patient
WHERE Last_Name LIKE '%e'
GO


/*-DISPLAY patient ID
-DISPLAY first name and patient last name
-DISPLAY admission date
-SORT admission dates results in descending order*/
SELECT Patient_ID, First_Name, Last_Name, Admission_Date
FROM patient
ORDER BY Admission_Date DESC
GO


/*-DISPLAY supplier count
-FIND the total count  of suppliers for the hospital*/
SELECT COUNT(Supplier_ID) AS "Total amount of suppliers"
FROM Supplier
GO


/*-DISPLAY diagnosis values
-FIND all diagnosis values at the hospital that start with the letter P*/
SELECT Code_, Value_
FROM diagnosis_lookup
WHERE Value_ LIKE 'p%'
GO
/* END OF Single Table Queries */
-- //////////////////////////////////////////////////////////////////////////////////////////////////// --


-- //////////////////////////////////////////////////////////////////////////////////////////////////// --
/* Beginning of MultiTable Queries */

/*- DISPLAY REmployee ID, EmployeeID, Clearance Value, and Hospital Address */
Select R.Remployee_ID, E.Employee_ID, CL.value_ AS "Clearance Description", H.Hospital_Address AS "Location"
From employee E, registration R, clearance_lookup CL, Hospital H
WHERE E.Employee_ID = R.Employee_ID AND CL.code_ = E.Clearance_Level AND E.Hospital_ID = H.Hospital_ID
GO


/*-Display the first and last name of each nurse and their specialty
- Grouped by their specialty.*/
Select E.First_Name as "First Name", E.Last_Name as "Last Name", nsl.Value_ as "Nurse Specialty"
FROM employee e, nurse n, nurse_specialty_lookup nsl
WHERE n.Nurse_Specialty = nsl.code_ AND n.Employee_ID = e.Employee_ID
Order By nsl.Value_
GO


/*-Display patient first name, last name, and patient type
- Find the hospital address according to each patient name 
-DISPLAY Hospital_address*/
Select p.First_Name, p.Last_Name, p.Patient_Type, h.Hospital_address
From patient p, hospital h
Where p.Hospital_ID = h.Hospital_ID
GO

/*-Display patient first name, last name, and Allergy Value
- Order by Patient Last Name*/
SELECT P.First_Name, P.Last_Name, AL.Value_
From Patient P, Medical_Record MR, Allergy_Lookup AL, Medical_Record_Allergies MRA
WHERE P.Patient_ID = MR.Patient_ID AND MR.Record_ID = MRA.Record_ID AND MRA.Allergy = AL.Code_
Order by P.Last_Name
GO


/*-Display first and last names of Doctors and their specialties
- Order by Doctor Specialty*/
SELECT E.First_Name as "First Name" , E.Last_Name as "Last Name" ,DSL.Value_ as "Doctor Specialty", D.Salary as "Doctor Salary", H.Hospital_Name as "Hospital Name"
FROM Hospital H, Employee E, Doctor_Specialty_Lookup DSL, Doctor D
WHERE E.Hospital_ID = H.Hospital_ID AND D.Employee_ID = E.Employee_ID
AND D.Doctor_Specialty = DSL.Code_
Order by Salary
GO
/* END OF MultiTable Queries */
-- //////////////////////////////////////////////////////////////////////////////////////////////////// --


