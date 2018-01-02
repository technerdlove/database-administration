# Managing Databases
## 1. Use the Management studio dialog to create a new database named "ITC226." Use the snippit tool to get a picture of the dialog box. Add a file to the database.

![Step 1](/images/Managing-Databases/mdimage1.png)

## 2. Create a new FileGroup and give it the name "ITC226Group1"

![Step 1](/images/Managing-Databases/mdimage2.png)

![Step 1](/images/Managing-Databases/mdimage3-5.png)

## 3. Add a new file name "ITC226FileB"
## 4. Make it a member of ITC226Group1
## 5. Use the snippit tool to get pictures of the file and file group dialogs

![Step 1](/images/Managing-Databases/mdimage6-7.png)

## Explain briefly the following recovery modes: Simple, Full, Bulk Logged
### Simple
* Does not back anything on the log
* Only as good as the last backup
### Full
*	Saves everything, logs get gigantic, but can restore up to the moment
### Bulk Logged
*	Ignores bulk inputs
*	Makes the log a little less big
