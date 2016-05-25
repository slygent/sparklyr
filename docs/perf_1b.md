RSpark Performance: 1B Rows
================

Setup
-----

``` r
library(rspark)

spark_install(version = "2.0.0", reset = TRUE, logging = "WARN")
sc <- spark_connect(master = "local[*]", version = "2.0.0")

spark_conf <- function(scon, config, value) {
  spark_context(scon) %>%
    spark_invoke("conf") %>%
    spark_invoke("set", config, value)
}

spark_sum_range <- function(scon, range) {
  # spark.range(1000L * 1000 * 1000).selectExpr("sum(id)").show()
  
  spark_context(scon) %>%
    spark_invoke("range", range) %>%
    spark_invoke("selectExpr", "sum(id)") %>%
    spark_invoke("show")
}
```

Spark 1.0
---------

    spark_conf(sc, "spark.sql.codegen.wholeStage", false)
    spark_sum_range(sc, 1000)

Spark 2.0
---------

    spark.conf.set("spark.sql.codegen.wholeStage", true)
    spark.range(1000).selectExpr("sum(id)").show()

Cleanup
=======

``` r
spark_disconnect(sc)
```