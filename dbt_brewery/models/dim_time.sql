select 
    generateUUIDv4() as uuid, 
    toDayOfWeek(toDate('2024/11/08')) as day,
    toMonth(toDate('2024/11/08')) as month,
    toYear(toDate('2024/11/08')) as year