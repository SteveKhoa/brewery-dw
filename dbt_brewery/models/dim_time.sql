CREATE TABLE DIM_TIME (
    uuid UUID,
    day UInt8,
    month UInt8,
    year UInt16
) 
ENGINE = MergeTree()
ORDER BY uuid;
