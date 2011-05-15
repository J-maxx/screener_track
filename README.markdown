# SCREENER TRACK

This is a rails application for handling the request, approval, fulfillment, and tracking of theatrical pre-release materials.

# GETTING STARTED / SAMPLE DATABASE

To explore the application, it is best to start with some sample data and of course a database. 

<ol>
	<li>Clone the repository, so that you can work with locally.</li>
	<li>rake db:migrate - To create your databse</li>
	<li>rake db:populate - Rake task to create 4 x users, projects, and assets</li>	
</ol>

# LOGGING IN / GETTING STARTED

The rake db: populate created 4 x types of users:

<ul>
	<li>user</li>
	<li>manager</li>
	<li>postcrew</li>
	<li>approver</li>
</ul>

You can login as any of the above user roles by using the following schema:<br />
<br />
**username:**	usertype@ff.com (i.e. manager@ff.com, user@ff.com, etc.)<br />
<br />
**password:**	pass<br />

# BASIC WORKFLOW

Here is a quick overview of the typical workflow for Screener Track:

*User makes request - status of request = 'requested'

*Approver approves or rejects the request: status ='approved' or 'rejected'

*Manager fulfills request: status = 'fulfilled'

And that is it.

Also User, Post crew can see their own requests

Approver sees requests with status requested and can approve or reject

Manager sees requests with status approved.

# THAT'S IT FOR NOW

This is a work in progress, but that is it for the moment.

** Brought to you by J-maxx and Charissa **
	
	
	



