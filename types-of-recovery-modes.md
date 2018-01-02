#Here I explain, briefly, recovery modes for databases in Microsoft SQL Server

## Simple
* Does not back anything on the log
* Only as good as the last backup
## Full
*	Saves everything, logs get gigantic, but can restore up to the moment
## Bulk Logged
*	Ignores bulk inputs
*	Makes the log a little less big
