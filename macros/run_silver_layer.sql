{% macro run_silver_layer() %}

  {{ log("Silver layer operation macro executed successfully!", info=True) }}
  {{ log("This macro cannot run models directly—dbt operations are for utilities only.", info=True) }}
  {{ log("To update silver layer:", info=True) }}
  {{ log("1. Temporarily comment out the 'gold' block in dbt_project.yml", info=True) }}
  {{ log("2. Use the 'Run' command in UI (only silver models will build)", info=True) }}
  {{ log("3. Re-enable gold block", info=True) }}
  {{ log("4. Manually refresh gold: ALTER DYNAMIC TABLE ANALYTICS_DB.GOLD.DAILY_SALES_SUMMARY REFRESH;", info=True) }}

{% endmacro %}