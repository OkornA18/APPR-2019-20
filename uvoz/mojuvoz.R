library(readr)
library(tidyr)
library(dplyr)


sl <- locale("sl", decimal_mark=",", grouping_mark=".")


tabela1 <- read_csv2("podatki/st_dijakov_po_regijah.csv", skip = 1, col_names = c("regija", "leto", "dijaki"),
                  locale=locale(encoding="Windows-1250"))

tabela2 <- read_csv2("podatki/st_dijakov_po_spolu_vrsti_izobrazevanja.csv", skip = 1, col_names = c("izobrazevanje", "letnik", "starost", "leto", "moski", "zenski"),
                     locale=locale(encoding="Windows-1250")) %>% select(c(-2, -3)) %>% mutate(leto=parse_number(leto))

tabela3 <- read_csv2("podatki/st_diplomantov_po_regijah.csv", skip = 1, col_names = c("regija", "leto", "diplomanti"),
                     locale=locale(encoding="Windows-1250"))

tabela4 <- read_csv2("podatki/st_diplomantov_po_vrsti_izobraževanja_spolu.csv", skip = 1, na = c("-"),  col_names = c("izobrazevanje", "leto", "moski", "zenski"),
                     locale=locale(encoding="Windows-1250")) %>% drop_na(3)

tabela5 <- read_csv2("podatki/st_studentov_po_vrsti_izobrazevanja_nacinu_studija.csv", skip = 1,na = c("-"), col_names = c("izobrazevanje", "leto", "redni", "izredni"),
                     locale=locale(encoding="Windows-1250"))%>% drop_na(3) %>% mutate(leto=parse_number(leto))

tabela13 <- tabela1 %>%
  mutate(leto=parse_number(leto), # leta pretvorimo v števila
         regija=gsub("^stalno", "Stalno", regija)) %>% # stalno -> Stalno na začetku
  full_join(tabela3) %>% # združimo po skupnih stolpcih in ohranimo vse vrstice
  filter(regija != "SLOVENIJA") %>% # odstranimo sumarne podatke
  gather(key="kategorija", value="stevilo", -regija, -leto) # pretvorimo v tidy data

tabela2nova <- gather(tabela2, -izobrazevanje, -leto, key=spol, value=stevilo, na.rm = TRUE)
tabela4nova <- gather(tabela4, -izobrazevanje, -leto, key=spol, value=stevilo, na.rm = TRUE)
tabela5nova <- gather(tabela5, -izobrazevanje, -leto, key=studij, value=stevilo, na.rm = TRUE)
