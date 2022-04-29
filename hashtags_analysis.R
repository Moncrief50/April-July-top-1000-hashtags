getwd()
setwd("/Users/robertmoncrief/Desktop/Twitter Data 2020/04-2020")
library(stringi)
library(readr)
library(stringr)
library(cld2)
library(dplyr)
library(tm)


# cleaning out environment
rm(list = ls())
# setting files to temp folder to be read into R
temp = list.files(path = "April", pattern = "*.csv", full.names = TRUE)
temp = temp[file.size(temp) > 150]

# read csv files
CSV_data <- read_csv(temp, col_select = c("user_id_str", "text", "retweeted_status_lang"), show_col_types = FALSE)
?read_csv
# Create data frame and take out languages that arent english.
CSV_data <- data.frame(CSV_data)

CSV_data <- subset(CSV_data, detect_language(CSV_data$text) == "en")
CSV_data <- subset (CSV_data, CSV_data$retweeted_status_lang == "en")#Gets rid of everything except english.

# Delete cornona virus related words
CSV_data$text <- stri_replace_all_regex(CSV_data$text,
                                        pattern = c("covid19", "COVID19", "Corona", "corona", "Coronavirus", "coronavirus", "CORONAVIRUS", "COVID-19", "Covid-19", "COVID19.", "COVID_19", "COVID__19",
                                                    "covid19", "COVID19,", "COVID19:", "CoronaVirus", "COVID", "coronavirus,", "COVID19...", "Covid19", "Covid_19", "covid_19", "COV...",
                                                    "pandemic,", "COVID-19", "covid19nigeria", "coronavirusupdate", "covid_...", "coivd19.", "coronavi...", "virus", "virus-related"),
                                        replacement = c("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
                                        vectorize = FALSE)


# Extracts hashtags from text 
hashtags <- str_extract_all(CSV_data$text, "#\\S+")
hashtags <- unlist(hashtags)


# delete all punctuation
hashtags <- gsub("[[:punct:] ]+", "", hashtags)

#This makes hashtags into a viewable table by decreasing order 
Hcount <- table(hashtags)
Hcount <- sort(Hcount, decreasing = TRUE)

#This counts unique users
UniqueUsers <- count(CSV_data, user_id_str)
duplicated(UniqueUsers) #checks to see if there is any duplicated users

#Top 300 most frequent hashtags / unique users
b <- Hcount[2:1001] / 10000000
b <- sort(b, decreasing = TRUE)
#Final Data frame
June_2020 <- data.frame(b)

write.csv(CSV_data, "/Users")












