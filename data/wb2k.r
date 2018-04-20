x = seq(-10, 18, 0.1)
plot(x, x^3 - 15*x^2 + rnorm(length(x), 0, 100))

## 1
(a) Create 2 fake variables where (1) X is a sequence of numbers from -10 to 10 in steps of 0.1, and (2) Y equals x^3 - 10*x^2 plus a random normal deviate with mean 0 and standard deviation 25. Show all of your R code for this problem.

(b) Plot X versus Y in a scatterplot. Be sure to label your axes and provide a plot title.

## 2

(c) Calculate correlation for the domains: X < 0,  0 < X < 10, X > 10, and the entire range of X. 

Using about 250 words... 
- explain why the 4 correlation figures you calculated differ from each other. Be sure to talk about the sign and magnitude of each number and relate them to those of each other.
- Describe major limitations of using correlation to describe the relationship we see between X and Y (hint: what types of relationships does correlation (not) work for? Do X and Y share that kind of relationship? How do you know?)

## 3
For problems 3-5, you will be working with a new dataset from the World Bank, containing GDP (million $), population (1000 people) and life expectancy figures in 2000 for countries around the world. You will find the data in our class website, and it can be loaded using standard techniques for loading CSV data.

Use the command na.omit to first drop all observations with NAs in them (hint: use '?na.omit' to research how to use the command. Pay particular attention to the examples section.). This should leave you with 191 observations. Using this subset of the full dataset, calculate the correlation between (1) GDP and population, and (2) GDP and life expectancy WITHOUT using the correlation command (hint: use the formula for calculating correlation from covariance). Show all of your R code for this problem.

## 4
Run 2 linear regressions: GDP on population (i.e. GDP is the DV, population is the IV) and life expectancy on GDP. Show regression tables for both regressions. In about 250 words, describe what these regression tables are telling us. At a minimum, you should talk about the meaning of the stars and what the estimated effects mean in real world terms. Keep this discussion purely to the numbers presented in the regression tables (i.e. don't talk about causes or bring in outside information).

## 5
Now, using about 250 words, speculate on some of the reasons why we see the patterns in the regression tables in problem 4. Further, using about 250 words (separate from the previous count), talk about whether you think GDP causes life expectancy. Is the answer to this question a strict yes-no? Are there other factors that might cause conflation or a common response situation?


####################
wb = read.csv('c:/users/daniel/dropbox/ps6/data/wb2k.csv')
wb1 = na.omit(wb)

par(mfrow=c(2,2))
with(wb, {
hist(gdp, main='GDP, 2000', xlab='GDP (1M $)')
hist(log(gdp), main='log(GDP), 2000', xlab='GDP (log 1M $)')
hist(life, main='world life expectancy, 2000', xlab='life expectancy (years)')
plot(life, log(gdp), main='life expectancy versus GDP', xlab='life expectancy (years)', xlab='GDP (log 1M $)')})

summary(m1 <- with(wb, lm(gdp ~ pop)))
summary(m2 <- with(wb, lm(life ~ gdp)))

summary(m3 <- with(wb, lm(life ~ pop)))