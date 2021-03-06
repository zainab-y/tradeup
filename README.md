# README

# A link (URL) to your published App
https://lit-spire-85165.herokuapp.com/
# A link to your GitHub repository
https://github.com/lilianamolloy/tradeup
# Description of your project
## Problem definition / purpose

Our project is called TradeUp, it is a web application for Property Managers and Trades People. We provide them a platform where property managers can submit jobs for property manaitenance and Trades People can then accept the job to complete. 

Our purpose is to meet the demand of Property Managers who have trouble finding trades poeple who are willing to accept small jobs, especially during busy time periods such as just before Christmas.

Our brainstorming process encouraged us all to look at the industries we came from and to assess any potential problem that could be solved with a two sided marketplace. One of our team members coming from a realestate background proposed the idea,which we all were interested in addressing.

## Functionality / features

The main functionality on the app is the ability for Property managers to create jobs and then the ability for Trades People to accep that job. 

We also included a my Jobs dashboard where a user can keep track of all their jobs and the different statuses of their job.

Once the job is marked as complete by the Trades Person, we give the property manager the ability to pay through stripe on the jobs show page. The job is then archived but can still be viewed through the user dashboard.

Ideally if we didnt have such a tight time constraint we would have collected the funds from the Property Manager at the begining confirming funds were available before posting the job. The funds would only be released once the job was completed and confirmed by the Property manager. This would be better for the user experience and give the Trades People a sense of trust that they will be paid.

Other features include auto complete of the address field this was accomplised through the Google geolocation API.

A search feature was added to the job index page, we created a serach action which was passed params to query the database. There is the ability to serach by category,postcode or both.

We setup mailer to alert the job creator at points where their job status changed including, creation someone accepting the job and completeion letting them know it is ready to be paid.

Verification email is sent out when a user signs up through devise. So the user is only generated when their email is confirmed.

Another feature we worked on was the configuration of the routes for when a user is not signed in. The user has the ability to click become a trader / submit the form on the home page which will redirect them accordingly once signed up or even if they click sign in from the sign up page. 

Unfortunetly this feature which we included for better user experience did not integrate well with the verification email we installed as the route path changed due to this. We were not able to resolve this issue due to time constrains. In future we would look into passing params through the email for correct redirection.

# Screenshots

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
# Tech stack (e.g. html, css, deployment platform, etc)

- HTML
- CSS
- Ruby
- Ruby on Rails
- Java Script
- Heroku - deployment
- AWS - s3 storage service
- Google geo location API
- Active storage - image handling
- pundit - gem
- devise - gem
- mailer -gem
  
# Instructions on how to setup, configure and use your App.

To use our app you simply follow the link above to our published app. 

Without signing in/signing up you only have the ability to view current jobs listed. 

## Property Manager
If you are a Property Manager you can create a new job either through the form on the home page or by clicking the "new job" link in the nav bar.

This will take you to the Create new Job page where you will need to fill the required fields before submitting.

Once created you will be on the Jobs show page where you have the option to edit or delete.

From there you can go to "My Jobs" page through the link in the nav bar where you can see the status of jobs assosiated to you.

## Trades Person
If you are a Trades Person once logged in you can wiew all jobs currently available on the "View Jobs" page through the link in the nav bar. 

You have the ability to use the search function located at the top of the page. You can search by category, postcode or both.

You then can go into the jobs page by clicking "View" from there you can click accept.

Before the job is your however we require your ABN and insurance number you can submit this by clicking the accept job link on the job show page or through "become a trades" link on the nav which will check if this field is completed and redirect accordingly. 

If you submit through the job page by clicking accept you will be redirected to the job page with the status of that job accepted.

Once the job is completed you can log in an head to my jobs console where you can change the status of the job by clicking "completed" on the job show page. this will then trigger an email to the Property manager advising theem that the job is done and payment is to be made.

# Design documentation including,
## Design process
## User stories / A workflow diagram of the user journey's 
## Wireframes
## Database Entity Relationship Diagrams
# Details of planning process including,
## Project plan & timeline
| Day       | Tasks          | 
| :-------------: |:-------------:| 
| Day 1      | Create rails project, push and deploy early. Create ERD and go through user stories. List jobs that need to be done for the project.  | 
| Day 2     | Complete diagram for user journey. Get the ERD approved and generate the models in the project. Scaffold jobs and generate user using devise.    |
| Day 3 | Implament pundit. Generate user profile. Complete associations. Implament Google geolocation. create actions for generating user profile when a user is registered, for accepting jobs, for completing jobs.     |
| Day 4 | Implament stripe. Add ability to edit user details through the user_profile. Create search function for the jobs index page.      |
| Day 5 | Implament mailer, configure the route paths for links on the nav bar for cases when user is not signed in and when they are.     |
| Day 6 | Implament drag and drop feature for inserting images on the job new page. Website design through Figma.      |
| Day 7 | Polish text on the site, CSS.      |
| Day 8 | Finish CSS.     |
| Day 9 | Testing. Complete ReadMe. Power Point presentation.     |
| Day 10 | Submit assignment.      |

## Screenshots of Trello board(s)

# Important Lessons We Learnt & Future Builds

# Questions
1. What is the need (i.e. challenge) that you will be addressing in your project?

The realestate industry is one of the largest industry in Australia. In saying that we would like to assist property managers to find trades people when all their regular trades are too busy or unable to attend as soon as required. We are also creating a platform for trades people who are able to go to to earn some extra money if they happen to have the time.

2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?

isnt this the same question?

3. Describe the project you will be conducting and how. your App will address the needs.

Along with it being a platform to connect maintenance which needs fixing and tradespeople with spare time. We will also be providing a place to compile maintenance jobs in an easy to manage and user friendly way. 

We all know a property manager who struggles with ensuring maintenance is done, this is largely due to the systems in place being unfriendly to to users and hard to understand with so many steps just to look at current out standing maintenance.

With our app we will simplify this and generate a page where both property managers and trades people can go to and immediatly can identify outstanding jobs, jobs to be paid, etc.

Ideally Property managers will even encourage their regular trades people to accep jobs through our app

4. Describe the network infrastructure the App may be based on.

???

5. Identify and describe the software to be used in your App.

- HTML is used in conjunction with embeded ruby in the view of the application.
- CSS is used in the styling of the application, aids in user friendlyness and visual appeal.
- Ruby is used in the controllers of the application 
- Ruby on Rails is the framework used for the basis of the app.
- Java Script - some JavaScrip was used to configure some of the gems used.

6. Identify the database to be used in your App and provide a justification for your choice.

After reviewing our database options which included sqlite and postgresql we settled on the latter for the following reasons.



???


Here I would talk about how postgres is different to sqlite, justify how postgres is way more powerful and how it fits really nicely into rails. 

7. Identify and describe the production database setup (i.e. postgres instance).

Here I would talk about the specifics of postgres, how it connects to your models, how it sits in overall MVC

8. Describe the architecture of your App.

We started by scaffolding Jobs, this generated the models views and controllers. This was necessary as we will require a page to display all the jobs(index) a jobs show page for each individual job, new page to create a job and edit page as well.

We generated users through devise and restricted access to new job page, create, edit and destroy. This is so we can associate the user with a particular job.

We also created a seperate user_profile model, view and controller. We created a method which generates a new empty user_profile each time a user registers. They then have the ability to edit and view the profile. We created a custom action in this controller for my jobs page where all jobs associated with the user is displayed.

The welcome page for our app is managed by the pages_controller and is set to the root path.

For our errors we genrated an errors controller which manages two views including 404 error and 500 errors. 

The charges controller was generated to handle the logic for the stripe gem.

A job mailer and view was also created to handle the emails sent out at different stages of the job status.




Yes go into detail about MVC, don’t describe any model associations yet

9. Explain the different high-level components (abstractions) in your App.

You could talk how ruby gems are an abstraction from your own ruby code. You could also talk about how active record is an abstraction of sql.

10. Detail any third party services that your App will use.
- Heroku is used to deploy the website
- AWS - s3 storage service for storing images uploaded
- Google geo location API used for auto complete when entering the address field
- Active storage - image handling
- pundit - gem is used for authenication, preventing certain users to access certain pages
- devise - gem is used for the generation of the user model along with the handling us user registration and sign ins.
- mailer -gem is used to send emails through the app.
- stripe -gem is used for payment handling and processing
- http://avatars.adorable.io/ - used to generate unique profile pictures based on usernames, if a user has not uploaded their picture. 

11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

A similar market place app would be hi pages. 

We can see that they also have user acounts along with some sort of user profile. We are unsure if this is seperated from the user like our application.

They have jobs pages including create edit, index etc.

Quoting system is present which ideally we would have in future builds. 

They have some sort of rating system for their trades people. For better user experience and trust this would ideally be added to our application in future builds.

12.  Discuss the database relations to be implemented.

The Jobs table is associated with the user through a join table. A job in this case has 2 users the property manager who is the creator; the first user associated with the job and the trades person who is the acceptor; the second person associated with the job.

This association may not be necessary at this stage, however we initially intended to have the tenant involved in the process in that case this association may be more useful.

Te jobs table also holds foreign keys for category and job status. Each job os one of each. the category is set when the job is created and the status is updated after each action.

The user has one user profile. This is generated after user registration is complete.

13.  Describe your project’s models in terms of the relationships (active record associations) they have with each other.

- job has_many_attached images
- job has_many user_jobs 
- job has_many users, through: user_jobs
- job belongs_to job_category
- job belongs_to job_status
- user has_one user_profile
- user has_many user_jobs
- user has_many jobs, through user_jobs
- job_category has_many jobs
- job_category has_many job_categories
- job_status has_many jobs
- user_profile belongs_to user
- user_profile has_one_attached image  

14.  Provide your database schema design.

![alt text](./docs/erd.png)

We seperated our ERD with two colours the pink is to be our MVP what we would aim to complete by the due date. The orange represents additional features we might add on should we have the time.

15.  Provide User stories for your App.
16.  Provide Wireframes for your App.
17.  Describe the way tasks are allocated and tracked in your project.
18.  Discuss how Agile methodology is being implemented in your project.
19. Provide an overview and description of your Source control process.
20. Provide an overview and description of your Testing process.

Once we reached MVP we went through the app as a user would. We checked each link to ensure it didnt return an error and that the routing was correct. 

We then requested feedback from fellow students to ensure that the interface was user friendly and easy to manuver.

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

21.  Discuss and analyse requirements related to information system security.

Make this a more general analysis of the ethics behind handling user data.

22. Discuss methods you will use to protect information and data.

Encryption - hashing passwords automatically.
Stripe - what manages and protects all credit card information
Pundit - controls authorisations and what users can see.

22. Research what your legal obligations are in relation to handling user data.
