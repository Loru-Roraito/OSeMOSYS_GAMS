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

#less basic plots
ggplot(data = results %>% 
         filter(REGION == "ITALY", 
                STORAGE %in% c("GLACIERS"), 
                variable == "StorageLevelYearStart", 
                scenario == "SCENctaxchanging_DATAitaly_base_STORyes")) +
  geom_line(aes(x = t, y = value, color = STORAGE), linewidth = 1) +
  ylab("Storage volume per year") + xlab("") + ggtitle("Glaciers and Dams") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

#less basic plots
ggplot(data = results %>% 
         filter(REGION == "ITALY", 
                STORAGE %in% c("DAM"), 
                variable == "StorageLevelYearStart", 
                scenario == "SCENctaxchanging_DATAitaly_base_STORyes")) +
  geom_line(aes(x = t, y = value, color = STORAGE), linewidth = 1) +
  ylab("Storage volume per year") + xlab("") + ggtitle("Glaciers and Dams") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

#less basic plots
ggplot(data = results %>% 
         filter(REGION == "ITALY", 
                STORAGE %in% c("HYDROGEN"), 
                variable == "StorageLevelYearStart", 
                scenario == "SCENctaxchanging_DATAitaly_base_STORyes")) +
  geom_line(aes(x = t, y = value, color = STORAGE), linewidth = 1) +
  ylab("Storage volume per year") + xlab("") + ggtitle("Glaciers and Dams") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

#less basic plots
ggplot(data = results %>%  
         filter(REGION == "ITALY", 
                TECHNOLOGY  %in% c("ROM", "STOR_HYDRO", "COAL", "GPP", "ROR", "OIL_GEN", "BIO", "WTE", "GEO", "SPV", "WPP"),
                variable == "TotalTechnologyAnnualActivity", 
                scenario == "SCENctaxchanging_DATAitaly_base_STORyes")) +
  geom_line(aes(x = t, y = value, color = TECHNOLOGY), linewidth = 1) +
  ylab("Energy production per year") + xlab("") + ggtitle("Energy production") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

#less basic plots
ggplot(data = results %>%  
         filter(REGION == "ITALY", 
                TECHNOLOGY  %in% c("ROR", "GEO", "SPV", "WPP", "BIO"),
                variable == "TotalTechnologyAnnualActivity", 
                scenario == "SCENctaxchanging_DATAitaly_base_STORyes")) +
  geom_line(aes(x = t, y = value, color = TECHNOLOGY), linewidth = 1) +
  ylab("Energy production per year") + xlab("") + ggtitle("Energy production") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

#less basic plots
ggplot(data = results %>%  
         filter(REGION == "ITALY", 
                TECHNOLOGY  %in% c("STOR_HYDRO", "ROR", "ROM"),
                variable == "TotalTechnologyAnnualActivity", 
                scenario == "SCENctaxchanging_DATAitaly_base_STORyes")) +
  geom_line(aes(x = t, y = value, color = TECHNOLOGY), linewidth = 1) +
  ylab("Energy production per year") + xlab("") + ggtitle("Energy production") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

#less basic plots
ggplot(data = results %>%  
         filter(REGION == "ITALY", 
                TECHNOLOGY  %in% c("COAL", "GPP", "OIL_GEN", "WTE"),
                variable == "TotalTechnologyAnnualActivity", 
                scenario == "SCENctaxchanging_DATAitaly_base_STORyes")) +
  geom_line(aes(x = t, y = value, color = TECHNOLOGY), linewidth = 1) +
  ylab("Energy production per year") + xlab("") + ggtitle("Energy production") +
  theme_classic() + 
  geom_hline(yintercept = 0, color = "grey")

             