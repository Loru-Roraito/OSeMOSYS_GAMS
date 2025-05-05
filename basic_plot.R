#### step 0: load all relevant packages
library(tidyverse)
library(gdxtools)

#### step 1: load result files 
## 1.1: list all result files
myfiles <- list.files(path="Results/.",pattern=".gdx")
## 1.2: list all gdx objects (sets, parameters, so on) that you want loaded
myvars <- c("TotalTechnologyAnnualActivity", "StorageLevelYearStart")

## step 1.3: load with batch extract and tidy the dataframe
results <- batch_extract(myvars,paste0("Results/",myfiles) ) %>%
  bind_rows(.id="variable") %>%
  mutate(gdx = str_remove_all(gdx,"Results/results_|.gdx"),
         t = as.numeric(YEAR) ) %>%
  as_tibble() %>% 
  rename(scenario=gdx) %>%
  select(t,REGION,STORAGE,TECHNOLOGY,variable,scenario,value)

## side note: tidy dataframe, long vs short
wide_ghg <- results %>% 
  pivot_wider(names_from="STORAGE",values_from="value")

long_ghg <- wide_ghg %>% 
  pivot_longer(c("GLACIERS"),values_to="value",names_to="STORAGE" )

#### STEP 2: plotting

## most basic plot...
ggplot(data=results %>% 
         filter(t <= 2 & 
                  REGION=="ITALY" & 
                  STORAGE=="GLACIERS" & 
                  variable=="StorageLevelYearStart" & 
                  scenario=="SCENbase_DATAitaly_STORyes") ) +
  geom_line( aes(x=t,y=value) )

#less basic plots
ggplot(data = results %>% 
         filter(REGION == "ITALY", 
                STORAGE %in% c("GLACIERS", "DAM"), 
                variable == "StorageLevelYearStart", 
                scenario == "SCENbase_DATAitaly_STORyes")) +
  geom_line(aes(x = t, y = value, color = STORAGE), linewidth = 1) +
  ylab("Storage volume per year") + xlab("") + ggtitle("Glaciers and Dams") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

#less basic plots
ggplot(data = results %>% 
         filter(REGION == "ITALY", 
                TECHNOLOGY == "ROM", 
                variable == "TotalTechnologyAnnualActivity", 
                scenario == "SCENbase_DATAitaly_STORyes")) +
  geom_line(aes(x = t, y = value, color = STORAGE), linewidth = 1) +
  ylab("Storage volume per year") + xlab("") + ggtitle("Glaciers and Dams") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

