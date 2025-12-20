
        

    
        

    

    

    -- get the standard backup name
    

    -- drop any pre-existing backup
    

    
        drop table if exists "ANALYTICS_DB"."SILVER"."STG_ORDERS__dbt_backup" cascade

    

;

    -- use `render` to ensure that the fully qualified name is used
    /*
    Rename or move a table to the new name.

    Args:
        relation: SnowflakeRelation - relation to be renamed
        new_name: Union[str, SnowflakeRelation] - new name for `relation`
            if providing a string, the default database/schema will be used if that string is just an identifier
            if providing a SnowflakeRelation, `render` will be used to produce a fully qualified name
    Returns: templated string
    */
    alter table "ANALYTICS_DB"."SILVER"."STG_ORDERS" rename to "ANALYTICS_DB"."SILVER"."STG_ORDERS__dbt_backup";
        

    
        create dynamic table ANALYTICS_DB.silver.stg_orders
        target_lag = '1 minutes'
        warehouse = COMPUTE_WH
        refresh_mode = INCREMENTAL

        initialize = ON_CREATE

        as (
            

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    TO_DATE(ORDER_DATE, 'YYYY-MM-DD') AS ORDER_DATE,
    CAST(NULLIF(AMOUNT, '') AS NUMBER) AS AMOUNT,
    UPPER(STATUS) AS STATUS
FROM ANALYTICS_DB.bronze.raw_orders
WHERE ORDER_ID IS NOT NULL
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY ORDER_ID 
    ORDER BY ORDER_DATE DESC  -- Or any column that indicates recency (e.g., event_ts, ingestion_ts)
) = 1
        )

    

;
        -- get the standard backup name
    

    

    
        drop table if exists "ANALYTICS_DB"."SILVER"."STG_ORDERS__dbt_backup" cascade

    



    

    


    