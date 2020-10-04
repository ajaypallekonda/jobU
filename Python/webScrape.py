# Importing Requests(HTML) and Beautiful Soup(Web Scraper)
import requests
import bs4
import json

URL = 'https://www.linkedin.com/jobs/search/?geoId=103644278&keywords=intern&location=United%20States'
page = requests.get(URL)

soup = bs4.BeautifulSoup(page.content, 'html.parser')

jobs = soup.find_all('li', attrs = {'class': 'result-card job-result-card result-card--with-hover-state'})

data = []

for job in jobs:
    title = job.find('h3', class_='result-card__title job-result-card__title')
    company = job.find('h4', class_='result-card__subtitle job-result-card__subtitle')
    location = job.find('span', class_='job-result-card__location')

    data.append({
        'name': title.text,
        'company': company.text,
        'location': location.text
    })

with open('C:/Users/ajayj/Desktop/Github/jobU/JSONWebServer/internships.json', 'w') as outfile:
    json.dump(data, outfile)

