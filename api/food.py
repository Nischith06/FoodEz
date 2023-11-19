from fastapi import FastAPI
import pandas as pd
from typing import Optional
app=FastAPI()

@app.get("/")
def index():
    return {"Hello": "World"}

@app.get("/food")
def food():
    data=pd.read_csv("data_sets/food.csv")
    return data.to_dict(orient='index')

@app.get("/food/canteen")
def canteen(canteen:str):
    data=pd.read_csv("data_sets/food.csv")
    data = data.fillna('')
    if len(data[data["Canteen_Name"]==canteen])==0:
        return {"Food": "Not Found"}
    else:
        return data[data["Canteen_Name"]==canteen].to_dict(orient="index")

@app.get("/food/food_category")
def food_category(food_category:str):
    data=pd.read_csv("data_sets/food.csv")
    if len(data[data["Food_Cat"]==food_category])==0:
        return {"Food": "Not Found"}
    else:
        return data[data["Food_Cat"]==food_category].to_dict(orient="index")

@app.get("/food/food_type")
def food_type(food_type:str):
    data=pd.read_csv("data_sets/food.csv")
    data = data.fillna('')
    if len(data[data["Food_Type"]==food_type])==0:
        return {"Food": "Not Found"}
    else:
        return data[data["Food_Type"]==food_type].to_dict(orient="index")

@app.post("/food/create-food")
def create_food(food_name:str,canteen_name:str,food_price:str,food_type:str,food_category:str,food_description:str, ingredients: Optional[str] = None):
    data=pd.read_csv("data_sets/food.csv")
    if len(data[data["Food_Name"]==food_name])!=0:
        return {"Error":"Food already exists"}
    else:
        record={'Food_Id':[len(data)+1],
                'Food_Name':[food_name],
                'Food_Price': [food_price],
                'Canteen_Name': [canteen_name],
                'Food_Type': [food_type],
                'Food_Cat':[food_category],
                'Food_Description': [food_description],
                'Ingredients': [ingredients],
                }
        record=pd.DataFrame(record)
        data=data.append(record,ignore_index=True)
        data.to_csv("data_sets/food.csv",index=False)
        if len(data[data["Food_Name"]==food_name])!=0:
            return {"Success":"Food created"}

@app.put("/food/update-food/{food_id}")
def update_food(food_id:int,food_name:Optional[str]=None,canteen_name:Optional[str]=None,food_price:Optional[str]=None,food_type:Optional[str]=None,food_category:Optional[str]=None,food_description:Optional[str]=None, ingredients: Optional[str] = None):
    data=pd.read_csv("data_sets/food.csv")
    if len(data[data["Food_Id"]==food_id])==0:
        return {"Error":"Food does not exist"}
    else:
        if food_name != None:
            data.loc[data["Food_Id"]==food_id,"Food_Name"]=food_name
        if canteen_name != None:
            data.loc[data["Food_Id"]==food_id,"Canteen_Name"]=canteen_name
        if food_price != None:
            data.loc[data["Food_Id"]==food_id,"Food_Price"]=food_price
        if food_type != None:
            data.loc[data["Food_Id"]==food_id,"Food_Type"]=food_type
        if food_category != None:
            data.loc[data["Food_Id"]==food_id,"Food_Cat"]=food_category
        if food_description != None:
            data.loc[data["Food_Id"]==food_id,"Food_Description"]=food_description
        if ingredients != None:
            data.loc[data["Food_Id"]==food_id,"Ingredients"]=ingredients
        data.to_csv("data_sets/food.csv",index=False)
        return {"Success":"Food updated"}

