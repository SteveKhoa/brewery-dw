import requests
from bs4 import BeautifulSoup
from models import Recipe
import re
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

        tds = recipe_header.find_all("td")
        title = tds[0].find("a", class_="recipetitle").contents[0].strip()
        style = tds[1].find("a").contents[0].strip()
        size = tds[2].contents[0].strip()
        og = tds[3].contents[0].strip()
        fg = tds[4].contents[0].strip()
        abv = tds[5].contents[0].strip()
        ibu = tds[6].contents[0].strip()
        color = tds[7].contents[0].strip()
        views = tds[8].contents[0].strip()
        brewed = tds[9].contents[0].strip()

        print("title: ", title)
        print("style: ", style)
        print("size: ", size)
        print("og: ", og)
        print("fg: ", fg)
        print("abv: ", abv)
        print("ibu: ", ibu)
        print("color: ", color)
        print("views: ", views)
        print("brewed: ", brewed)

        recipe_expand = recipe_group[1]

        author = recipe_expand.find_all('span', class_="username")[1].text.strip()
        boil_size = recipe_expand.find("b", string=re.compile(".*Boil.*")).parent.contents[1].strip()
        boil_time = recipe_expand.find("b", string="Boil Time:").parent.contents[1].split(" ")[1].strip()
        boil_gravity = recipe_expand.find("b", string="Boil Gravity:").parent.contents[1].split(" ")[1].strip()
        efficiency = recipe_expand.find("b", string="Efficiency:").parent.contents[1].split(" ")[1].strip()
        mash_thickness = recipe_expand.find("b", string="Mash Thickness:").parent.contents[1].split(" ")[1].strip()
        sugar_scale = recipe_expand.find("b", string=re.compile(".*Sugar.*")).parent.contents[1].strip()
        brew_method = recipe_expand.find("b", string=re.compile(".*Brew.*")).parent.contents[1].strip()
        pitch_rate = recipe_expand.find("b", string="Pitch Rate:").parent.contents[1].split(" ")[1].strip()
        primary_temp = recipe_expand.find("b", string=re.compile(".*Primary.*")).parent.contents[1].strip()
        priming_method = recipe_expand.find("b", string="Priming Method:").parent.contents[1].strip()
        priming_amount = recipe_expand.find("b", string="Priming Amount:").parent.contents[1].strip()

        creation_date = " ".join(recipe_expand.find("b", string=re.compile(".*Creation.*")).parent.contents[1:]).strip()
        notes = " ".join([x.text.strip() for x in recipe_expand.find("b", string="Notes:").parent.contents[1:]]).strip()

        print("author: ", author)
        print("boil_size: ", boil_size)
        print("boil_time: ", boil_time)
        print("boil_gravity: ", boil_gravity)
        print("efficiency: ", efficiency)
        print("mash_thickness: ", mash_thickness)
        print("sugar_scale: ", sugar_scale)
        print("brew_method: ", brew_method)
        print("pitch_rate: ", pitch_rate)
        print("primary_temp: ", primary_temp)
        print("primary_method: ", priming_method)
        print("priming_amount: ", priming_amount)
        print("creation_date: ", creation_date)
        print("notes: ", notes)

        """
Author:		kcq101
Boil Size: 7.5 Gallons	
Boil Time: 60	
Boil Gravity: 1.048	
Efficiency: 70	
Mash Thickness: 1.25	
Sugar Scale: Specific Gravity
Brew Method: All Grain	
Pitch Rate: 0.35	
Primary Temp: N/A	
Priming Method: N/A	
Priming Amount: N/A	
Creation Date: 5/31/2016 2:52 PM
Notes: Fermentation Dry Hop @ 70% attenuation (1.027), Traditional Dry Hop after fermentation is complete. Fermentation temp: 68F

Author:	mackeydj
Boil Size: 6.5 Gallons	
Boil Time: 60	
Boil Gravity: 1.061	
Efficiency: 75	
Mash Thickness: N/A	
Sugar Scale: Specific Gravity
Brew Method: All Grain	
Pitch Rate: 0.75	
Primary Temp: 65 ° F	
Priming Method: N/A	
Priming Amount: N/A	
Creation Date: 3/2/2012 2:44 AM
Notes: afasfas
        """

        print(".\n.\n.\n.\n.\n.\n.\n")


if __name__ == "__main__":
    fetch_page()
