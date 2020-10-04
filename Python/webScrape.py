import requests
import bs4

URL = 'https://www.google.com/search?q=software+engineering+internships&rlz=1C5CHFA_enUS874US874&oq=software+engineering+internships&aqs=chrome.0.69i59j35i39j0l3j69i60l3.3898j0j1&sourceid=chrome&ie=UTF-8&ibp=htl;jobs&sa=X&ved=2ahUKEwjJ0OWe1ZnsAhUkHDQIHZnAAcYQiYsCKAB6BAgdEAQ&sxsrf=ALeKk00Ug5rHogEEPi9xF7QgiBtJMvSXVQ:1601770805102#htivrt=jobs&htidocid=QL3rbbH0p7CLYJgiAAAAAA%3D%3D&fpstate=tldetail'
page = requests.get(URL)

soup = bs4.BeautifulSoup(page.content, 'html.parser')

print(21)