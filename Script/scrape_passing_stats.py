import pandas as pd
from bs4 import BeautifulSoup
import requests

# URL for the passing stats table
url = "https://www.pro-football-reference.com/years/2024/passing.htm"

# method to fetch data
def fetch_passing_data(url: str) -> pd.DataFrame:
    print(f"Fetching data from: {url}")
    
    # Request the page
    response = requests.get(url)
    if response.status_code != 200:
        raise Exception(f"Failed to fetch page: {response.status_code}")
    
    # Parse the HTML content
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # Locate the table by ID
    table = soup.find('table', {'id': 'passing'})
    if table is None:
        raise Exception("Could not find the passing stats table.")
    
    # Extract rows
    rows = table.find('tbody').find_all('tr', {'class': None})  # Ignore header rows with class
    
    # Define the structure
    data = {
        'Player': [], 'Team': [], 'Pos': [],'Cmp': [], 
        'Att': [], 'Yds': [], 'TD': [], 'Int': [],
    }
    
    # Iterate over rows and extract cell data
    for row in rows:
        cells = row.find_all('td')
        if cells:
            data['Player'].append(cells[0].text.strip())
            data['Team'].append(cells[2].text.strip())
            data['Pos'].append(cells[3].text.strip())
            data['Cmp'].append(cells[7].text.strip())
            data['Att'].append(cells[8].text.strip())
            data['Yds'].append(cells[10].text.strip())
            data['TD'].append(cells[11].text.strip())
            data['Int'].append(cells[13].text.strip())
    
    # Convert to DataFrame
    return pd.DataFrame(data)

# main 
if __name__ == '__main__':
    # Fetch data
    passing_df = fetch_passing_data(url)
    # Print result
    print(passing_df)
    ## Optionally, save to CSV
    #passing_df.to_csv('passing_stats.csv', index=False)
