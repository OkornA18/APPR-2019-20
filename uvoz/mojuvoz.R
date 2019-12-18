library(readr)
library(tidyr)
library(dplyr)


sl <- locale("sl", decimal_mark=",", grouping_mark=".")


tabela1 <- read_csv2("podatki/st_dijakov_po_regijah.csv", skip = 1, col_names = c("Regija", "Leto", "Število dijakov"),
                  locale=locale(encoding="Windows-1250"))

tabela2 <- read_csv2("podatki/st_dijakov_po_spolu_vrsti_izobrazevanja.csv", skip = 1, col_names = c("Vrsta izobraževanja", "Letnik", "Starost", "Leto", "Število moških", "Število žensk"),
                     locale=locale(encoding="Windows-1250")) %>% select(c(-2, -3)) %>% mutate(Leto=parse_number(Leto))

tabela3 <- read_csv2("podatki/st_diplomantov_po_regijah.csv", skip = 1, col_names = c("Regija", "Leto", "Število diplomantov"),
                     locale=locale(encoding="Windows-1250"))

tabela4 <- read_csv2("podatki/st_diplomantov_po_vrsti_izobraževanja_spolu.csv", skip = 1, na = c("-"),  col_names = c("Vrsta izobraževanja", "Leto", "Število moških", "Število žensk"),
                     locale=locale(encoding="Windows-1250")) %>% drop_na(3)

tabela5 <- read_csv2("podatki/st_studentov_po_vrsti_izobrazevanja_nacinu_studija.csv", skip = 1,na = c("-"), col_names = c("Vrsta izobraževanja", "Leto", "Redni študij", "Izredni študij"),
                     locale=locale(encoding="Windows-1250"))%>% drop_na(3) %>% mutate(Leto=parse_number(Leto))

tabela13 <- tabela1 %>%
  mutate(Leto=parse_number(Leto), # leta pretvorimo v števila
         Regija=gsub("^stalno", "Stalno", Regija)) %>% # stalno -> Stalno na začetku
  full_join(tabela3) %>% # združimo po skupnih stolpcih in ohranimo vse vrstice
  filter(Regija != "SLOVENIJA") %>% # odstranimo sumarne podatke
  gather(key="Kategorija", value="Stevilo", -Regija, -Leto) # pretvorimo v tidy data
