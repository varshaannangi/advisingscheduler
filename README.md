# MavAppointPhase2-

Phase 2 Of MavAppoint

Advising Scheduler application

About the application

The Advising Scheduler is a Web application of UT Arlington which is rebuilt with some new requirements. Academic Advising is an opportunity to exchange information designed to help students reach their educational and career goals. Advising is a shared responsibility between an adviser and the student. Academic advisers can assist in this process by helping the student understand options, determine resources and, when necessary, identify alternatives by creating appointment slots, deleting appointment hours. Whereas students can manage their accounts, book an appointment, delete appointment etc.

Softwares Used: ->
	Eclipse Java EE Edition / NetBeans
  	Tomcat Server 7/ GlassFish
  	MySQL

Setting Up: ->
  Creating a Database Using MySQL 

  Making a Connection Using NetBeans/Eclipse

  Running SQL Script: Creating Tables 

  Apache Tomcat and GlassFish V2 Web Server

  Planning the Structure and Cloning Project from Git

  Referencing the Datasource from the Application

  Adding the Database Driver's JAR File  and given JAR files to the Server

  Deploying and Running the Project

Database Setup:-> 
  Open MySQL workbench
  Create new instance
  Provide username as "root" and password as "advising"
    
    If we keep the database info the same on every machine, we won't have to make changes in the code as to which server to connect to

  Initialize DB instance

Import Source code :->
  Copy the URL from GitHub 
  Open Eclipse 
  Go to Menu → File → Import → Git → Projects from Git →URI
  Select "Source Files" Folder
  Configure Tomcat server with Project
  Configure Build Path if required
  Right Click on project 
  Run on Server → Choose Tomcat as Server

This would give you access to index page of Advising Scheduler

You can run on any browser like chrome/Mozilla with URL
  http://localhost:8081/AdvisingScheduler/



