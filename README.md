# Analiza sekundarnega in terciarnega izobraževanja
## Ana Marija Okorn

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2019/20

* [![Shiny](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/OkornA18/APPR-2019-20/master?urlpath=shiny/APPR-2019-20/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/OkornA18/APPR-2019-20/master?urlpath=rstudio) RStudio

## Tematika

V svojem projektu bom analizirala vključenost otrok v srednje šole ter študentov v ustanove namenjene terciarnemu izobraževanju. Vse podatke, ki jih bom vključila v svojo projektno nalogo, sem dobila na SURS-u(statistični urad republike Slovenije).Večino podatkov bom vzela od leta 2007-2018.

V tabele bom vključila število dijakov v posameznih statističnih regijah. Prikazala bom tudi delež dijakov po spolu po posameznih vrstah izobraževanja ter število dijakov po letnikih, vrsti vpisa in vrsti izobraževanja.Prikazala bom tudi število diplomantov na leto glede na vrsto izobraževanja vrsti in načinu študija in na spol, kasneje jih bom razdelila tudi po statističnih regijah.

Do tabel dostopam preko statističnega urada Republike Slovenije. Tabele lahko prenesem iz interneta na mnogo načinov, med drugim CSV, HTML, XML, XLS itd.

 1.tabela Dijaki po statistični regiji stalnega prebivališča, Slovenija, letno https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__09_izobrazevanje__07_srednjesol_izobraz__01_09532_zac_sol_leta/0953237S.px/
  Stolpci:
  -Regija
  -Leto
  -Število dijakov

 2.tabela Dijaki po spolu in vrsti izobraževanja, Slovenija, letno https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__09_izobrazevanje__07_srednjesol_izobraz__01_09532_zac_sol_leta/0953221S.px/
  Stolpci:
  -Vrsta izobraževanja
  -Leto
  -Število dijakov moškega spola
  -Število dijakov ženskega spola 

 3.tabela Diplomanti terciarnega izobraževanja po vrsti izobraževanja in spolu, Slovenija, letno https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__09_izobrazevanje__08_terciarno_izobraz__02_09554_diplomanti_splosno/0955430S.px/
  Stolpci:
  -Regija
  -Leto
  -Število diplomantov

 4.tabela Diplomanti terciarnega izobraževanja po statistični regiji stalnega prebivališča, Slovenija, letno https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__09_izobrazevanje__08_terciarno_izobraz__02_09554_diplomanti_splosno/0955472S.px/
  Stolpci:
  -Vrsta izobraževanja
  -Leto
  -Število diplomantov moškega spola
  -Število diplomantov ženskega spola

 5.tabela Študenti terciarnega izobraževanja po vrsti izobraževanja in načinu študija, Slovenija, letno https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__09_izobrazevanje__08_terciarno_izobraz__01_09550_vpisani_splosno/0955030S.px/
  Stolpci:
  -Vrsta izobraževanja
  -Leto
  -Število študentov, ki opravlja izredni študij
  -Število študentov, ki opravlja redni študij

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `tidyr` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
