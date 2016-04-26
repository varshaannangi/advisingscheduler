# MavAppointPhase2-

Phase 2 Of MavAppoint

Advising Scheduler application

About the application

The Advising Scheduler is a Web application of UT Arlington which is rebuilt with some new requirements. Academic Advising is an opportunity to exchange information designed to help students reach their educational and career goals. Advising is a shared responsibility between an adviser and the student. Academic advisers can assist in this process by helping the student understand options, determine resources and, when necessary, identify alternatives by creating appointment slots, deleting appointment hours. Whereas students can manage their accounts, book an appointment, delete appointment etc.

Softwares Used: ->

	1.Eclipse Java EE Edition / NetBeans

  	2.Tomcat Server / GlassFish (latest version would suffice)

  	3.MySQL

Setting Up: ->
   1.Creating a Database Using MySQL 

   2.Making a Connection Using NetBeans/Eclipse

   3.Running SQL Script: Creating Tables 

   4.Apache Tomcat and GlassFish V2 Web Server

   5.Planning the Structure and Cloning Project from Git

   6.Referencing the Datasource from the Application

   7.Adding the Database Driver's JAR File  and given JAR files to the Server

   8.Deploying and Running the Project

Database Setup:-> 

   1.Open MySQL workbench

   2.Create new instance

   3.Provide username as "root" and password as "advising"

    If we keep the database info the same on every machine, we won't have to make changes in the code as to which server to connect to

   4.Initialize DB instance

Import Source code :->

   1.Copy the URL from GitHub 

   2.Open Eclipse 

   3.Go to Menu → File → Import → Git → Projects from Git →URI

   4.Select "Source Files" Folder

   5.Configure Tomcat server with Project

   6.Configure Build Path if required

   7.Right Click on project 

   8.Run on Server → Choose Tomcat as Server

This would give you access to index page of Advising Scheduler

You can run on any browser like chrome/Mozilla with URL

  http://localhost:8081/AdvisingScheduler/



