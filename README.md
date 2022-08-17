<h1>Salesforce Technical Test<h1>
<h2>Scenario</h2>
<p>The CRM team has decided they want to perform better outreach to newly created Contacts in Salesforce.</p>
<h3>Requirements</h3>
<ul>
<li>For each new Contact inserted to Salesforce, a Case related to the Contact should automatically be
created.</li>
<li>The solution should be able to handle bulk inserts.</li>
<li>It is advisable that the Case is inserted after any other business logic has run, as this may affect
variables.</li>
<li>The Case should be created with the following criteria</li>
<li>Case should be related to the Contact</li>
<li>If the Contact is related to an Account, the Case should also be related to the Account</li>
<li>Case Status - 'Working'</li>
<li>Case Origin - 'New Contact'</li>
<li>Owner of the Case should be the same as the User who owns the Contact</li>
</ul>
<p>The Contact object has a Level pick list (Level__c). This will determine the priority of the Case.</p>
<ul>
<li>If the Contact Level is Primary, the Case Priority should be High</li>
<li>If the Contact Level is Secondary, the Case Priority should be Medium</li>
<li>If the Contact Level is Tertiary, the Case Priority should be Low.</li>
<ul>
<h4>A minimum of 75% Test Coverage should be written for all triggers/classes - the higher the better.</h4>
<h3>Bonus Requirements</h3>
<ul>
<li>Create a Task for each new Case, matching the following criteria</li>
<li>Task Status - 'Not Started'</li>
<li>Task Subject - Welcome call for {the related Case Number}</li>
<li>Task Priority - 'Normal'</li>
<li>Task Due Date should be dependent on the related Case Priority</li>
<li>If the Case is High Priority, the Due Date should be in 1 week</li>
<li>If the Case is Medium Priority, the Due Date should be in 2 weeks</li>
<li>If the Case is Low Priority, the Due Date should be in 3 weeks</li>
<li>The Owner of the Task should be the same as the User who owns the Contact</li>
</ul>
