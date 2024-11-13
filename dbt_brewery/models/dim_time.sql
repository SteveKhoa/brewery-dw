SELECT
    generateUUIDv4() as uuid,
    toDayOfWeek(toDate('2024/11/08') + number) as day,
    toMonth(toDate('2024/11/08') + number) as month,
    toYear(toDate('2024/11/08') + number) as year
FROM numbers(10)