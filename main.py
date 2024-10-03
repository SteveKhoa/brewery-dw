import requests
from bs4 import BeautifulSoup
from models import Recipe
from extract import group_by_pairs, extract_recipe

def extract_recipes(html: str):
    soup = BeautifulSoup(html, features="html.parser")
    ingredient_page_content = soup.find("div", class_="ingredient-page-content")
    tbody = ingredient_page_content.find_all("tbody")[1]
    recipes = tbody.find_all("tr", recursive=False)
    recipe_groups = group_by_pairs(recipes)

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


def main():
    for page in range(1, 10):
        page_content = fetch_page(page)
        
        for recipe in page_content:
            (
                title,
                style,
                size,
                og,
                fg,
                abv,
                ibu,
                color,
                views,
                brewed,
                author,
                boil_size,
                boil_time,
                boil_gravity,
                efficiency,
                mash_thickness,
                sugar_scale,
                brew_method,
                pitch_rate,
                primary_temp,
                priming_method,
                priming_method,
                priming_amount,
                creation_date,
                notes,
            ) = recipe

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

            print(".\n.\n.\n.\n.\n.\n.\n")


if __name__ == "__main__":
    main()
