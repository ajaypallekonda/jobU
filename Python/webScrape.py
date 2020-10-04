# Importing Requests(HTML) and Beautiful Soup(Web Scraper)
import requests
import bs4
import re

links = []
links_two = []

URL = 'https://www.linkedin.com/jobs/search/?geoId=103644278&keywords=intern&location=United%20States'
page = requests.get(URL)

soup = bs4.BeautifulSoup(page.content, 'html.parser')

jobs = soup.find_all('li', attrs = {'class': 'result-card'})


# for link in soup.find_all('a', href=True):
#     if link.has_attr('href'):
#         links.append(link['href'])
#
# print(links)
#
# for link in links:
#     if 'https://www.linkedin.com/jobs/view/' in link:
#         links_two.append(link)

# print(links_two)


for job in jobs:
    title = job.find('h3', class_='result-card__title job-result-card__title')
    company = job.find('h4', class_='result-card__subtitle job-result-card__subtitle')
    location = job.find('span', class_='job-result-card__location')
    date_posted = job.find('time', class_='job-result-card__listdate')
    link = job.find('a', href=True)

    if None in (title, company, location, date_posted):
        continue

    print(title.text)
    print(company.text)
    print(location.text)
    print(date_posted.text)
    if link.has_attr('href'):
        print(link['href'])
    print()

