



URL paths


GET /users - Retrieve a list of users.
POST /users - Create a new user.
GET /users/{userId} - Retrieve a detailed view of a specific user.
PUT /users/{userId} - Update a specific user.
DELETE /users/{userId} - Delete a specific user.
GET /users/{userId}/applications - Retrieve all applications submitted by a specific user.


GET /companies - Retrieve a list of companies.
POST /companies - Create a new company.
GET /companies/{companyId} - Retrieve details about a specific company.
PUT /companies/{companyId} - Update a specific company.
DELETE /companies/{companyId} - Delete a specific company.
GET /companies/{companyId}/applications - Retrieve all applications for jobs posted by a specific company.
GET /companies/{companyId}/jobs - Retrieve all jobs for a specific company.
POST /companies/{companyId}/jobs - Create a new job under a specific company.


GET /jobs/{jobId} - Retrieve details about a specific job.
PUT /jobs/{jobId} - Update a specific job.
DELETE /jobs/{jobId} - Delete a specific job.
GET /jobs/{jobId}/applications - Retrieve all applications for a specific job.
POST /jobs/{jobId}/applications - Submit a new application for a job.
DELETE /applications/{applicationId} - Delete a specific application.


GET /applications/{applicationId} - Retrieve details about a specific application.
PUT /applications/{applicationId} - Update a specific application.



DATABASE

# run DDL script
psql -U vln2_assignment_groups_77_user -d postgres -h verklegt-namskeid-ii.northeurope.cloudapp.azure.com -p 5432 -a -f DDL.sql

# password
xF9akvOp8P

# view all tables
\dt vln2_assignment_groups_77.*;

SELECT * FROM vln2_assignment_groups_77.companies_company;

DELETE FROM vln2_assignment_groups_77.companies_company 
WHERE name = 'Advania';

# delete all tables

DROP TABLE IF EXISTS vln2_assignment_groups_77.applications_application, vln2_assignment_groups_77.companies_company, vln2_assignment_groups_77.jobs_joboffer, vln2_assignment_groups_77.users_customuser, vln2_assignment_groups_77.django_migrations, vln2_assignment_groups_77.django_content_type, vln2_assignment_groups_77.auth_group, vln2_assignment_groups_77.auth_group_permissions, vln2_assignment_groups_77.auth_permission, vln2_assignment_groups_77.auth_user, vln2_assignment_groups_77.auth_user_groups, vln2_assignment_groups_77.auth_user_user_permissions, vln2_assignment_groups_77.django_admin_log, vln2_assignment_groups_77.django_session CASCADE;




# migration

python manage.py makemigrations

python manage.py migrate

