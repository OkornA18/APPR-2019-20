# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
#                             pot.zemljevida="OB", encoding="Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
#zemljevid <- fortify(zemljevid)

# Izračunamo povprečno velikost družine
#povprecja <- druzine %>% group_by(obcina) %>%
#  summarise(povprecje=sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))
library(ggplot2)
library(tmap)

povprecje.dijakovindiplomantov.po.regijah <- tabela1nova %>% group_by(regija,kategorija) %>% summarise(povprecje=sum(stevilo)/10)
seznam <- split(povprecje.dijakovindiplomantov.po.regijah, povprecje.dijakovindiplomantov.po.regijah$kategorija)
povprecje.dijakov.po.regijah <- seznam[[1]]
povprecje.diplomantov.po.regijah <- seznam[[2]]
povprecje.dijakov.po.regijah <- povprecje.dijakov.po.regijah[-12,] %>% select(-"kategorija")
povprecje.diplomantov.po.regijah <- povprecje.diplomantov.po.regijah[-12,] %>% select(-"kategorija")

zemljevid <- uvozi.zemljevid("https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_SVN_shp.zip", "gadm36_SVN_1")
zemljevid1 <- tm_shape(merge(zemljevid, povprecje.diplomantov.po.regijah, by.x="NAME_1", by.y="regija" )) + tm_polygons("povprecje",title="Povprečje") + tm_layout(title="Povprečno število diplomantov po regijah v zadnjih desetih letih")

graf1 <- ggplot(povprecje.dijakov.po.regijah, aes(regija, povprecje, group = 1)) + geom_col() + coord_flip() +
  labs(x = "Regija", y = "Povprecje", 
       title = "Povprečno število dijakov po regijah v zadnjih desetih letih")
graf2 <- ggplot(povprecje.diplomantov.po.regijah, aes(regija, povprecje, group = 1)) + geom_col() + coord_flip() +
  labs(x = "Regija", y = "Povprecje", 
       title = "Povprečno število diplomantov po regijah v zadnjih desetih letih")

m <- tabela2nova %>% group_by(izobrazevanje, spol) %>% summarise(povprecje=sum(stevilo)/10) %>%filter(spol == "moski") %>% select(-"spol")
z <- tabela2nova %>% group_by(izobrazevanje, spol) %>% summarise(povprecje=sum(stevilo)/10) %>%filter(spol == "zenski")%>% select(-"spol")
graf3 <- ggplot(m, aes(izobrazevanje, povprecje, group = 1)) + geom_col() + coord_flip() + labs(x = "Vrsta izobraževanja", y = "Število moških", 
                                                                                             title = "Povprečno število moških v posameznih vrstah \nizobraževanj v zadnjih desetih letih")
graf4 <- ggplot(z, aes(izobrazevanje, povprecje, group = 1)) + geom_col() + coord_flip()+ labs(x = "Vrsta izobraževanja", y = "Število žensk", 
                                                                                               title = "Povprečno število žensk v posameznih vrstah \nizobraževanj v zadnjih desetih letih")

podatki5 <- tabela2nova %>% group_by(izobrazevanje, spol) %>% summarise(povprecje=sum(stevilo)/10)
  
#ggplot(podatki5, aes(x=izobrazevanje, y=povprecje, group = 1)) + geom_bar()  + coord_flip() + labs(x = "Vrsta izobraževanja", y = "Povprečno število", title = "test")

