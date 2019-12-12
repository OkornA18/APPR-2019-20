library(readr)

library(tidyr)

library(dplyr)
sl <- locale("sl", decimal_mark=",", grouping_mark=".")



tabela1 <- read_csv2("podatki/st_dijakov_po_regijah.csv", skip = 3, col_names = c("Regija", "2009/2010", "2010/2011", "2011/2012", "2012/2013", "2013/2014", "2014/2015", "2015/2016", "2016/2017", "2017/2018", "2018/2019"),
                  locale=locale(encoding="Windows-1250"))