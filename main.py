import requests
from bs4 import BeautifulSoup
from models import Recipe
from extract import group_by_pairs, extract_recipe
from time import sleep
import pandas as pd
import threading

def extract_recipes(html: str):
    try:
        soup = BeautifulSoup(html, features="html.parser")
        ingredient_page_content = soup.find("div", class_="ingredient-page-content")
        tbody = ingredient_page_content.find_all("tbody")[1]
        recipes = tbody.find_all("tr", recursive=False)
        recipe_groups = group_by_pairs(recipes)
    except:
        return []

    return [extract_recipe(recipe_group) for recipe_group in recipe_groups]


def fetch_page(page=1):
    url = f"https://www.brewersfriend.com/homebrew-recipes/page/{page}/"
    res = requests.get(
        url,
        headers={
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36"
        },
    )
    return extract_recipes(res.text)

def export_to_csv(recipes, type="success"):
    headers = ("title", "style", "size", "og", "fg", "abv", "ibu", "color", "views", "brewed", "author", "boil_size",
           "boil_time", "boil_gravity", "efficiency", "mash_thickness", "sugar_scale", "brew_method", "pitch_rate",
           "primary_temp","priming_method", "primary_method", "priming_amount", "creation_date", "notes")
    
    print (len(recipes))
    df = pd.DataFrame(recipes, columns=headers)
    if type == "success":
        print ("Exporting to CSV - Number of recipes:")
        df.to_csv("recipes.csv", index=False, mode='a')
    else:
        print ("Dump csv files:")
        df.to_csv("recipes_error.csv", index=False)

def main():
    page_content = []
    for page in range(1000, 15000):
        single_page_content = fetch_page(page)
        while (single_page_content == []):
            print (f"Error on page {page}")
            single_page_content = fetch_page(page)
            sleep(1.5)
        
        page_content+= single_page_content
        sleep(1.5)
    
    export_to_csv(page_content)


if __name__ == "__main__":
    main()
