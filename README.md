DESCRIPTION
1. Vaccine Availability in Inventory:
The INVENTORY entity holds details about different vaccines, which are supplied to hospitals.
The relationship supplies between INVENTORY and HOSPITAL indicates that hospitals receive vaccines from the inventory. Attributes such as quantity and time represent when and how much vaccine is supplied.

2. Hospitals Offering Specific Vaccine Brands:
The HOSPITAL entity is related to the VACCINE entity through the Provides relationship.
This implies that each hospital offers specific vaccine brands (e.g., Covaxin, Covishield). The v_name attribute in the VACCINE entity captures the vaccine brand information.

3. Tracking Vaccine Doses:
The DOCTOR entity is responsible for vaccinating patients, represented by the vaccinates relationship between DOCTOR and PERSON.
The attributes First and Second associated with the vaccinates relationship capture the dates when a patient (PERSON) received their first and second doses of the vaccine.

4. Database Updates:
Every time a patient receives a vaccine dose, the database is updated with the details, including the vaccine brand, hospital, doctor, and dates of administration.

In summary, the database system models the following:

Inventory Management: Which vaccines are available and supplied to specific hospitals.

Hospital Offerings: Each hospital provides a specific brand of vaccine.

Patient Vaccination Tracking: The dates for first and second doses are tracked by the hospital system and are updated in the database accordingly.
