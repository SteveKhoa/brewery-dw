from dataclasses import dataclass

@dataclass
class Recipe:
    title: str
    style: str
    size: float
    size_unit: str
    og: float
    fg: float
    abv: float
    ibu: float
    color: float
    color_unit: str
    views: int
    brewed: int

    author: str
    boil_size: float
    boil_size_unit: str
    # ...