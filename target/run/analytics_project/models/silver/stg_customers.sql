
        

    
        

    

    

    -- get the standard backup name
    

    -- drop any pre-existing backup
    

    
        drop table if exists "ANALYTICS_DB"."SILVER"."STG_CUSTOMERS__dbt_backup" cascade

    

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
    alter table "ANALYTICS_DB"."SILVER"."STG_CUSTOMERS" rename to "ANALYTICS_DB"."SILVER"."STG_CUSTOMERS__dbt_backup";
        

    
        create dynamic table ANALYTICS_DB.silver.stg_customers
        target_lag = '1 minutes'
        warehouse = COMPUTE_WH
        refresh_mode = INCREMENTAL

        initialize = ON_CREATE

        as (
            

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CASE 
        WHEN EMAIL LIKE '%@%.%' THEN EMAIL 
        ELSE NULL 
    END AS EMAIL,
    TO_DATE(SIGNUP_DATE, 'YYYY-MM-DD') AS SIGNUP_DATE
FROM ANALYTICS_DB.bronze.raw_customers
        )

    

;
        -- get the standard backup name
    

    

    
        drop table if exists "ANALYTICS_DB"."SILVER"."STG_CUSTOMERS__dbt_backup" cascade

    



    

    


    