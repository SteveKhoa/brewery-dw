import requests
from bs4 import BeautifulSoup
from models import Recipe
import json

def group_by_pairs(recipes):
    recipe_header = recipes[::2]
    recipe_expand = recipes[1::2]

    return [x for x in zip(recipe_header, recipe_expand)]


def fetch_page():
    page = 1
    url = f"https://www.brewersfriend.com/homebrew-recipes/page/{page}/"

    res = requests.get(
        url,
        headers={
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36"
        },
    )

    soup = BeautifulSoup(res.text, features="html.parser")
    ingredient_page_content = soup.find("div", class_="ingredient-page-content")
    tbody = ingredient_page_content.find_all("tbody")[1]
    recipes = tbody.find_all("tr", recursive=False)
    recipe_groups = group_by_pairs(recipes)

    for recipe_group in recipe_groups:
        recipe_header = recipe_group[0]
        recipe_expand = recipe_group[1]
        
        tds = recipe_header.find_all("td")
        title = tds[0].find("a", class_="recipetitle").contents[0]
        style = tds[1].find("a").contents[0]
        size_tuple = tds[2].contents[0].split(" ")
        size = float(size_tuple[0])
        size_unit = str(size_tuple[1])
        og = tds[3].contents[0]
        fg = tds[4].contents[0]
        abv = tds[5].contents[0]
        ibu = tds[6].contents[0]
        color_tuple = tds[7].contents[0].split(" ")
        color = float(color_tuple[0])
        color_unit = str(color_tuple[1])
        views = tds[8].contents[0]
        brewed = tds[9].contents[0]

        print("title: ", title)
        print("style: ", style)
        print("size: ", size)
        print("size_unit: ", size_unit)
        print("og: ", og)
        print("fg: ", fg)
        print("abv: ", abv)
        print("ibu: ", ibu)
        print("color: ", color)
        print("color_unit: ", color_unit)
        print("views: ", views)
        print("brewed: ", brewed)

        print(".\n.\n.\n.\n.\n.\n.\n")




if __name__ == "__main__":
    fetch_page()
