# Pewlett-Hackard-Analysis

# Overview:
As the “Silver Tsunami '' aka a mass retirement of employees begins to happen. Pewlett Hackard is making proactive attempts to combat any type of disruption within their company. As this migration is bound to happen, we were tasked with a project of creating an employee database. Using provided csv files and Sql, we were tasked with creating a series of data sets regarding their retiring employees. After completing the main data set. We were then asked again to narrow, and add some more variables to the data set. More specifically, to add two more technical analyses consisting of: the number of retiring employees by title, as well as the number of employees eligible for the mentorship program. 

# Analysis/Results:
After completion of the requested analysis, a few things can be derived from each of the deliverables. The Retirement title gave us a complete set of who was retiring, as well as their titles, and what department they belonged to. However, the problem was that there were duplicates. Now these duplicates are not necessarily a bad thing. But what they are showing us, is the individual who had their job titles altered in some form. Hopefully for a promotion, and not a demotion. But overall that left the data set slightly skewed.

Continuing on there were a few more questions that needed to be answered. Since there are so many individuals up for retirement. It begs the question of how many of those individuals have already retired. The Unique Titles table, narrowed the data frame to give us the people who are about to leave, as in eligible to retire. Verses the ones that have already left. 

The Retiring titles, on the other hand, allowed us to filter really any unnecessary information. The result was seven rows and two columns. Consisting of the total count of people retiring and their job titles. Super clean, super simple. See image below. 

<img width="181" alt="Retiring_titles " src="https://user-images.githubusercontent.com/102453818/167755864-31b3dde8-dd0f-45fd-b771-cb85fc792625.png">

Now because there is going to be so much movement around the company. There really should not be too much disruption to daily tasks. However, in order to achieve this, proper training is critical, and needs to be implemented sooner rather than later. This led us to the mentorship eligibility table. Which did show us that there are people to take on the tasks of mentoring, and training the incoming workforce. Is it feasible? Not exactly. 

# Summary: 
Now that all the results have been received. Here is where things get interesting. While there are technically 41,380 people eligible for retirement. The odds of them all taking it at once are pretty slim. So what that essentially means is, based on the unique titles, and the retiring titles tables. There are going to be 90,399 people retiring. Which is honestly a lot. Hypothetically, if all 90,399 people decided to leave by the end of year. 90,000+ jobs is a lot to fill, even if Pewlett Hackard was prepared to fill all those positions. There are only 1,940 people qualified to be mentors. That equates to about 1 mentor to about 47 new hires. Which is not feasible, practical, or even remotely appropriate. With so many working parts to make a company run smoothly. There needs to be a few more variables introduced to make this mass movement more practical. Right now there is only data on who is retiring, but adding who is currently still working to the table, as well as what the mentorship eligibility requirements. Both would be beneficial as well. Why? Well, having 1 mentor to 47 new hires does not make sense. It would be more practical to have the mentor, use their knowledge to mentor existing employees. Who knows the in and out of their jobs. Alter their job description, have them be added to the mentorship eligibility, and obviously compensate them. But realistically speaking a senior level mentor mentoring say four of their current co-works would add a total of 7,760 eligible mentors. If 90,399 jobs were filled that would be about 1 mentor to 12 new hires. While still a little high, it's a lot better than 1 to 47. 

Last thing to note, the compensation of these employees is really sus. As in it does not make sense. After adding a few queries. Specifically manager_salaries, and retiring_slalaries (see  Employee_database_challange.sql for queries) and (Challenge_data folder for csv). But it does not make sense that there are four managers for how big this company is. And two of them left. But those who have stayed, are Research and Sales, and their salaries are honestly really low. But also when looking at the people who are retiring. Their salaries are concerning too. For example upon first glance of the csv, a senior engineer should not be making forty grand. It really does not make sense. But maybe the data originally given was not update as well as it could have been. So maybe there is some information missing. 

Image of manager salary. See retiring salaries csv for other info.
<img width="843" alt="manager_salary" src="https://user-images.githubusercontent.com/102453818/168522888-1b7ff574-0dd9-4c29-97a3-96213721fd08.png">








