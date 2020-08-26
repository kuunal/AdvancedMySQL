import time
import asyncio
import aiohttp
import json
import aiofiles
import mysql.connector
import csv
from concurrent.futures import ThreadPoolExecutor


async def fetch(url):
    async with aiohttp.ClientSession() as session:
        response = await session.get(url)
        data = await response.text()
        return data

async def main(urls):
    data = await fetch(urls)
    json_data = json.loads(data)
    asyncio.gather(insert_into_csv(json_data), insert_into_db(json_data))

    return json_data


async def insert_into_csv(json_data):
    with open('covid.csv', 'w') as csv_file:
        await write_csv(csv_file, json_data)
        

async def write_csv(csv_file, json_data):
    writer = csv.DictWriter(csv_file, fieldnames=['dailyconfirmed', 'dailydeceased', 'dailyrecovered', 'date', 'totalconfirmed', 'totaldeceased', 'totalrecovered'])
    writer.writeheader()
    writer.writerows(json_data['cases_time_series'])


async def insert_into_db(json_data):
    conn = mysql.connector.connect(user='root', password='1234', host='127.0.0.1', database='parkinglot')
    cursor = conn.cursor()
    # print(json_data)
    for data in json_data['cases_time_series']:
        is_inserted = cursor.execute('''insert into covid(dailyconfirmed,
        dailydeceased, 
        dailyrecovered, 
        date,   
        totalconfirmed, 
        totaldeceased, 
        totalrecovered) values(%s, %s, %s, %s, %s, %s, %s)''',
        (data['dailyconfirmed'], data['dailydeceased'], data['dailyrecovered'], data['date'], data['totalconfirmed'], data['totaldeceased'], data['totalrecovered'] ))
        # print(data['dailyconfirmed'])
    conn.commit()
    cursor.close()




try:
    t = time.perf_counter()
    # json_data = asyncio.run(main("https://api.covid19india.org/data.json"))
    
    # asyncio.set_event_loop(asyncio.ProactorEventLoop())
    loop = asyncio.get_event_loop()
    loop.set_debug(True)
    loop.run_until_complete(main("https://api.covid19india.org/data.json"))
    print(time.perf_counter()-t,"saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
except Exception as e:
    print(e)
finally:
    loop.close()

