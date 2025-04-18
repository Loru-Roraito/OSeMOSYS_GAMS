* ITALY_DATA.GMS - specify Utopia Model data in format required by GAMS
*
* OSEMOSYS 2011.07.07 conversion to GAMS by Ken Noble.Noble-Soft Systems - August 2012
* OSEMOSYS 2016.08.01 update by Thorsten Burandt, Konstantin L�ffler and Karlo Hainsch, TU Berlin (Workgroup for Infrastructure Policy) - October 2017
* OSEMOSYS 2020.04.13 reformatting by Giacomo Marangoni
* OSEMOSYS 2020.04.15 change yearsplit by Giacomo Marangoni
* OSEMOSYS 2024.03.27 change storage initial conditions by Pietro Andreoni

* OSEMOSYS 2016.08.01
* Open Source energy Modeling SYStem
*
*#      Based on ITALY version 5: BASE - Utopia Base Model
*#      Energy and demands in PJ/a
*#      Power plants in GW
*#      Investment and Fixed O&M Costs: Power plant: Million $ / GW (//$/kW)
*#      Investment  and Fixed O&M Costs Costs: Other plant costs: Million $/PJ/a
*#      Variable O&M (& Import) Costs: Million $ / PJ (//$/GJ)
*#
*#****************************************


*------------------------------------------------------------------------	
* Sets       
*------------------------------------------------------------------------

set     YEAR    / 2025*2075 /; 
set     TECHNOLOGY      /
        COAL 'Coal power plants'
        NUCLEAR 'Nuclear power plants'
        ROR 'run-of-river hydroelectric power plants'
        STOR_HYDRO 'Pumped storage'
        DIESEL_GEN 'Diesel power plants'
        IMPDSL1 'Diesel imports'
        IMPGSL1 'Gasoline imports'
        IMPHCO1 'Coal imports'
        IMPOIL1 'Crude oil imports'
        IMPURN1 'Uranium imports'
        RHE 'Residential heaters - electric'
        RHO 'Residential heaters - oil'
        RL1 'Residential light bulbs'
        SRE 'Crude oil refinery'
        TXD 'Personal vehicles - diesel'
        TXE 'Personal vehicles - electric'
        TXG 'Personal vehicles - gasoline'
        RIV 'River'

        RHG 'Residential heating - gas'
        RC1 'Residential cooling'
        RHD 'Residential heating - diesel'
        RHCC 'Residential heating - waste/cogeneration heat'
        IHE 'Industrial heating - electric'
        IHG 'Industrial heating - gas'
        IHC 'Industrial heating - coal'
        IMPGAS1 'Natural gas imports'
        IMPBIO1 'Biomass supply'
        OCGT 'Open cycle gas turbines'
        CCGT 'Combined cycle gas turbines'
        CHP 'Cogeneration plants'
        OIL_GEN 'Oil power plants'
        BIO 'Biomass power plants'
        GEO 'Geothermal power plants'
        WTE 'Waste-to-energy power plants'
        SPV 'Solar power plants'
        WPP 'Wind power plants'
        HEL 'Hydrogen Electrolyzers'
/;

set     TIMESLICE       /
        ID 'Intermediate - day'
        IN 'Intermediate - night'
        SD 'Summer - day'
        SN 'Summer - night'
        WD 'Winter - day'
        WN 'Winter - night'
/;

set     FUEL    /
        DSL 'Diesel'
        ELC 'Electricity'
        GSL 'Gasoline'
        HCO 'Coal'
        HYD 'Hydro'
        OIL 'Crude oil'
        URN 'Uranium'
        RH 'Demand for residential heating'
        RL 'Demand for residential lighting'
        
        TX 'Demand for personal transport'
        RC 'Demand for residential cooling'
        IH 'Demand for industrial heating'

        GAS 'Natural gas'
        WBM 'Woody biomass'
        WST 'Waste'
        GTH 'Geothermal energy'
        SUN 'Solar energy'
        WIN 'Wind energy'
        THE 'Thearmal energy'
/;

set     EMISSION        / CO2, NOX /;
set     MODE_OF_OPERATION       / 1, 2 /;
set     REGION  / ITALY /;
set     SEASON / 1, 2, 3 /;
set     DAYTYPE / 1 /;
set     DAILYTIMEBRACKET / 1, 2 /;
set     STORAGE / DAM, HYDROGEN /;

# characterize technologies 
set power_plants(TECHNOLOGY) / COAL, NUCLEAR, ROR, DIESEL_GEN, OCGT, CCGT, CHP, OIL_GEN, BIO, GEO, WTE, SRE, SPV, WPP  /;
set storage_plants(TECHNOLOGY) / HEL, STOR_HYDRO /;
set fuel_transformation(TECHNOLOGY) / SRE /;
set appliances(TECHNOLOGY) / RHE, RHO, RL1, TXD, TXE, TXG, RHG, RC1, RHD, RHCC, IHE, IHG, IHC /;
set unmet_demand(TECHNOLOGY) / /;
set transport(TECHNOLOGY) / TXD, TXE, TXG /;
set primary_imports(TECHNOLOGY) / IMPHCO1, IMPOIL1, IMPURN1, IMPGAS1, IMPBIO1 /;
set secondary_imports(TECHNOLOGY) / IMPDSL1, IMPGSL1 /;

set renewable_tech(TECHNOLOGY) /ROR, SPV, WPP, WTE, BIO, GEO/; 
set renewable_fuel(FUEL) /HYD, WBM, GTH, SUN, WIN/; 

set fuel_production(TECHNOLOGY);
set fuel_production_fict(TECHNOLOGY) /RIV/;
set secondary_production(TECHNOLOGY) /COAL, NUCLEAR, ROR, STOR_HYDRO, DIESEL_GEN, SRE, OCGT, CCGT, CHP, OIL_GEN, BIO, GEO, WTE, SPV, WPP, HEL /;

#Characterize fuels 
set primary_fuel(FUEL) / HCO, OIL, URN, HYD, GAS, WBM, WST, GTH, SUN, WIN, THE /;
set secondary_carrier(FUEL) / DSL, GSL, ELC /;
set final_demand(FUEL) / RH, RL, TX, RC, IH /;

*$include "Model/osemosys_init.gms"

*------------------------------------------------------------------------	
* Parameters - Global
*------------------------------------------------------------------------


parameter YearSplit(l,y) /
  ID.(2025*2075)  .3333
  IN.(2025*2075)  .1667
  SD.(2025*2075)  .1667
  SN.(2025*2075)  .0833
  WD.(2025*2075)  .1667
  WN.(2025*2075)  .0833
/;

DiscountRate(r) = 0.05;

DaySplit(y,lh) = 12/(24*365);

parameter Conversionls(l,ls) /
ID.2 1
IN.2 1
SD.3 1
SN.3 1
WD.1 1
WN.1 1
/;

parameter Conversionld(l,ld) /
ID.1 1
IN.1 1
SD.1 1
SN.1 1
WD.1 1
WN.1 1
/;

parameter Conversionlh(l,lh) /
ID.1 1
IN.2 1
SD.1 1 
SN.2 1
WD.1 1
WN.2 1
/;

DaysInDayType(y,ls,ld) = 7;

TradeRoute(r,rr,f,y) = 0;

DepreciationMethod(r) = 1;


*------------------------------------------------------------------------	
* Parameters - Demands       
*------------------------------------------------------------------------

parameter SpecifiedDemandProfile(r,f,l,y) /
  ITALY.RH.ID.(2025*2075)  .12
  ITALY.RH.IN.(2025*2075)  .06
  ITALY.RH.SD.(2025*2075)  0
  ITALY.RH.SN.(2025*2075)  0
  ITALY.RH.WD.(2025*2075)  .5467
  ITALY.RH.WN.(2025*2075)  .2733
  ITALY.RL.ID.(2025*2075)  .15
  ITALY.RL.IN.(2025*2075)  .05
  ITALY.RL.SD.(2025*2075)  .15
  ITALY.RL.SN.(2025*2075)  .05
  ITALY.RL.WD.(2025*2075)  .5
  ITALY.RL.WN.(2025*2075)  .1
  ITALY.RC.ID.(2025*2075)  .3
  ITALY.RC.IN.(2025*2075)  0
  ITALY.RC.SD.(2025*2075)  .5
  ITALY.RC.SN.(2025*2075)  .2
  ITALY.RC.WD.(2025*2075)  0
  ITALY.RC.WN.(2025*2075)  0
  ITALY.IH.ID.(2025*2075)  .3
  ITALY.IH.IN.(2025*2075)  .033
  ITALY.IH.SD.(2025*2075)  .3
  ITALY.IH.SN.(2025*2075)  .033
  ITALY.IH.WD.(2025*2075)  .3
  ITALY.IH.WN.(2025*2075)  .034
/;

parameter SpecifiedAnnualDemand(r,f,y) /

/;

parameter AccumulatedAnnualDemand(r,f,y) /

/;

parameter OperationalLife(r,t) /

/;

parameter ResidualCapacity(r,t,y) /

/;

parameter InputActivityRatio(r,t,f,m,y) /

/;

parameter CapitalCost /

/;

parameter VariableCost(r,t,m,y) /

/;

parameter FixedCost /

/;

parameter TechnologyToStorage(r,m,t,s) /

/;

parameter TechnologyFromStorage(r,m,t,s) /

/;

parameter TotalAnnualMaxCapacity /

/;

parameter TotalAnnualMinCapacity(r,t,y) /

/;

parameter EmissionActivityRatio(r,t,e,m,y) /

/;

parameter CapacityFactor (r,t,l,y) / 

/;

parameter AvailabilityFactor (r,t,y) / 

/;

parameter StorageLevelStart(r,s) /

/;

Parameter OutputActivityRatio(r,t,f,m,y) /

/;

Parameter InputActivityRatio(r,t,f,m,y) /

/;
































** residential heating technologies
InputActivityRatio(r,"RHE","ELC","1",y) = 1;
InputActivityRatio(r,"RHG","GAS","1",y) = 1;
InputActivityRatio(r,"RHD","DSL","1",y) = 1;
InputActivityRatio(r,"RHCC","THE","1",y) = 1;
OutputActivityRatio(r,"RHE","RH","1",y) = 1;
OutputActivityRatio(r,"RHG","RH","1",y) = 1;
OutputActivityRatio(r,"RHD","RH","1",y) = 1;
OutputActivityRatio(r,"RHCC","RH","1",y) = 1;

** residential lighting and cooling
InputActivityRatio(r,"RL1","ELC","1",y) = 1;
InputActivityRatio(r,"RC1","ELC","1",y) = 1;
OutputActivityRatio(r,"RHCC","RH","1",y) = 1;
OutputActivityRatio(r,"RL1","RL","1",y) = 1;

** personal transport
InputActivityRatio(r,"TXD","DSL","1",y) = 1; 
InputActivityRatio(r,"TXE","ELC","1",y) = 1;
InputActivityRatio(r,"TXG","GSL","1",y) = 1;
# here you want to switch from energy to km travelled: km/TWh
OutputActivityRatio(r,"TXD","TX","1",y) = 1;
OutputActivityRatio(r,"TXE","TX","1",y) = 1;
OutputActivityRatio(r,"TXG","TX","1",y) = 1;

** industrial heating technologies
InputActivityRatio(r,"IHE","ELC","1",y) = 1;
InputActivityRatio(r,"IHG","GAS","1",y) = 1;
InputActivityRatio(r,"IHC","HCO","1",y) = 1;
# demand for industrial heating is thermal
OutputActivityRatio(r,"IHE","IH","1",y) = 1;
OutputActivityRatio(r,"IHG","IH","1",y) = 1;
OutputActivityRatio(r,"IHC","IH","1",y) = 1;

*** characterize technologies
CapitalCost(r,'IMPDSL1',y) = 0;
VariableCost(r,'IMPDSL1',m,y) = 50; # cost of diesel in $/MWh
FixedCost(r,'IMPDSL1',y) = 0;
OperationalLife(r,'IMPDSL1') = 999;
AvailabilityFactor(r,'IMPDSL1',y) = 1;
EmissionActivityRatio(r,'IMPDSL1','CO2','1',y) = 0.075;

CapitalCost(r,'IMPGSL1',y) = 0;
VariableCost(r,'IMPGSL1',m,y) = 70; # cost of gasoline in $/MWh
FixedCost(r,'IMPGSL1',y) = 0;
OperationalLife(r,'IMPGSL1') = 999;
AvailabilityFactor(r,'IMPGSL1',y) = 1;
EmissionActivityRatio(r,'IMPGSL1','CO2','1',y) = 0.075;

CapitalCost(r,'IMPHCO1',y) = 0;
VariableCost(r,'IMPHCO1',m,y) = 30; # cost of coal in $/MWh
FixedCost(r,'IMPHCO1',y) = 0;
OperationalLife(r,'IMPHCO1') = 999;
AvailabilityFactor(r,'IMPHCO1',y) = 1;
EmissionActivityRatio(r,'IMPHCO1','CO2','1',y) = 0.089;

CapitalCost(r,'IMPOIL1',y) = 0;
VariableCost(r,'IMPOIL1',m,y) = 60; # cost of oil in $/MWh
FixedCost(r,'IMPOIL1',y) = 0;
OperationalLife(r,'IMPOIL1') = 999;
AvailabilityFactor(r,'IMPOIL1',y) = 1;
EmissionActivityRatio(r,'IMPOIL1','CO2','1',y) = 0.075;

CapitalCost(r,'IMPGAS1',y) = 0;
VariableCost(r,'IMPGAS1',m,y) = 40; # cost of gas in $/MWh
FixedCost(r,'IMPGAS1',y) = 0;
OperationalLife(r,'IMPGAS1') = 999;
AvailabilityFactor(r,'IMPGAS1',y) = 1;
EmissionActivityRatio(r,'IMPGAS1','CO2','1',y) = 0.055;

CapitalCost(r,'IMPBIO1',y) = 0;
VariableCost(r,'IMPBIO1',m,y) = 20; # cost of biomass in $/MWh  
FixedCost(r,'IMPBIO1',y) = 0;
OperationalLife(r,'IMPBIO1') = 999;
AvailabilityFactor(r,'IMPBIO1',y) = 1;
EmissionActivityRatio(r,'IMPBIO1','CO2','1',y) = 0;

# Characterize SOLAR technology
OperationalLife(r,'SPV') = 15;
CapacityFactor(r,'SPV','ID',y) = 0.4;
CapacityFactor(r,'SPV','IN',y) = 0;
CapacityFactor(r,'SPV','SD',y) = 0.8;
CapacityFactor(r,'SPV','SN',y) = 0;
CapacityFactor(r,'SPV','WD',y) = 0.1;
CapacityFactor(r,'SPV','WN',y) = 0;
CapitalCost(r,'SPV',y) = 1000;
VariableCost(r,'SPV',m,y) = 1e-5;
FixedCost(r,'SPV',y) = 5;
ResidualCapacity(r,"SPV",y) = 9;

# Characterize WIND technology
OperationalLife(r,'WPP') = 15;
CapacityFactor(r,'WPP','ID',y) = 0.2;
CapacityFactor(r,'WPP','IN',y) = 0.3;
CapacityFactor(r,'WPP','SD',y) = 0.1;
CapacityFactor(r,'WPP','SN',y) = 0.15;
CapacityFactor(r,'WPP','WD',y) = 0.3;
CapacityFactor(r,'WPP','WN',y) = 0.4;
CapitalCost(r,'WPP',y) = 1200;
VariableCost(r,'WPP',m,y) = 1e-5;
FixedCost(r,'WPP',y) = 7;
ResidualCapacity(r,"WPP",y) = 12;

# Characterize WASTE-TO-ENERGY technology
OperationalLife(r,'WTE') = 25;
CapitalCost(r,'WTE',y) = 2000;
VariableCost(r,'WTE',m,y) = 1e-5;
FixedCost(r,'WTE',y) = 10;
ResidualCapacity(r,"WTE",y) = 0.67;

# Characterize BIOMASS technology
OperationalLife(r,'BIO') = 25;
AvailabilityFactor(r,'BIO',y) = 0.85;
CapitalCost(r,'BIO',y) = 2000;
VariableCost(r,'BIO',m,y) = 1e-5;
FixedCost(r,'BIO',y) = 10;
ResidualCapacity(r,"BIO",y) = 1.54;

# Characterize GEOTHERMAL technology
OperationalLife(r,'GEO') = 25;
CapitalCost(r,'GEO',y) = 2000;
VariableCost(r,'GEO',m,y) = 1e-5;
FixedCost(r,'GEO',y) = 10;
ResidualCapacity(r,"GEO",y) = 0.87;

# Characterize RUN-OF-RIVER technology
OperationalLife(r,'ROR') = 80;
AvailabilityFactor(r,'ROR',y) = 0.27;
CapitalCost(r,'ROR',y) = 3000;
VariableCost(r,'ROR',m,y) = 1e-5;
FixedCost(r,'ROR',y) = 10;
ResidualCapacity(r,"ROR",y) = 12;

# Characterize COAL technology
OperationalLife(r,'COAL') = 50;
AvailabilityFactor(r,'COAL',y) = 0.8;
CapitalCost(r,'COAL',y) = 1200;
VariableCost(r,'COAL',m,y) = 1e-5;
FixedCost(r,'COAL',y) = 10;
ResidualCapacity(r,"COAL",y) = 5;

# Characterize OCGT technology
OperationalLife(r,'OCGT') = 25;
AvailabilityFactor(r,'OCGT',y) = 0.75;
CapitalCost(r,'OCGT',y) = 2000;
VariableCost(r,'OCGT',m,y) = 1e-5;
FixedCost(r,'OCGT',y) = 10;
ResidualCapacity(r,"OCGT",y) = 15;

# Characterize CCGT technology
OperationalLife(r,'CCGT') = 35;
AvailabilityFactor(r,'CCGT',y) = 0.85;
CapitalCost(r,'CCGT',y) = 2000;
VariableCost(r,'CCGT',m,y) = 1e-5;
FixedCost(r,'CCGT',y) = 10;
ResidualCapacity(r,"OCGT",y) = 30;

# Characterize COGENERATION technology
OperationalLife(r,'CHP') = 40;
AvailabilityFactor(r,'CHP',y) = 0.85;
CapitalCost(r,'CHP',y) = 2000;
VariableCost(r,'CHP',m,y) = 1e-5;
FixedCost(r,'CHP',y) = 10;

# Characterize OIL technology
OperationalLife(r,'OIL_GEN') = 40;
AvailabilityFactor(r,'OIL_GEN',y) = 0.85;
CapitalCost(r,'OIL_GEN',y) = 2000;
VariableCost(r,'OIL_GEN',m,y) = 1e-5;
FixedCost(r,'OIL_GEN',y) = 10;
ResidualCapacity(r,"OIL_GEN",y) = 1.55;

# Characterize refineries 
OperationalLife(r,'SRE') = 40;
AvailabilityFactor(r,'SRE',y) = 0.85;
CapitalCost(r,'SRE',y) = 2000;
VariableCost(r,'SRE',m,y) = 1e-5;
FixedCost(r,'SRE',y) = 10;
ResidualCapacity(r,"SRE",y) = 1.55;

InputActivityRatio(r,'SPV','SUN',"1",y) = 1; #IEA convention
OutputActivityRatio(r,'SPV','ELC',"1",y) = 1; 

InputActivityRatio(r,'WPP','WIN',"1",y) = 1; #IEA convention
OutputActivityRatio(r,'WPP','ELC',"1",y) = 1; 

InputActivityRatio(r,'WTE','WST',"1",y) = 1/0.25; 
OutputActivityRatio(r,'WTE','ELC',"1",y) = 1;

InputActivityRatio(r,'BIO','WBM',"1",y) = 1/0.25;
OutputActivityRatio(r,'BIO','ELC',"1",y) = 1;

InputActivityRatio(r,'GEO','GTH',"1",y) = 1/0.25;
OutputActivityRatio(r,'GEO','ELC',"1",y) = 1;

InputActivityRatio(r,'COAL','HCO',"1",y) = 1/0.45;
OutputActivityRatio(r,'COAL','ELC',"1",y) = 1;

InputActivityRatio(r,'ROR','HYD',"1",y) = 1;
OutputActivityRatio(r,'ROR','ELC',"1",y) = 1;

** open cycle gas turbines
InputActivityRatio(r,'OCGT','GAS',"1",y) = 1/0.35;
OutputActivityRatio(r,'OCGT','ELC',"1",y) = 1;

** cogeneration power plants produce electricity and heat
InputActivityRatio(r,'CHP','GAS',"1",y) = 1/0.6;
OutputActivityRatio(r,'CHP','ELC',"1",y) = 1;
OutputActivityRatio(r,'CHP','THE',"1",y) = 1;

** CCGT can also function as OCGT
InputActivityRatio(r,'CCGT','GAS',"1",y) = 1/0.6;
InputActivityRatio(r,'CCGT','GAS',"2",y) = 1/0.3;
OutputActivityRatio(r,'CCGT','ELC',"1",y) = 1;
OutputActivityRatio(r,'CCGT','ELC',"2",y) = 1;

** oil power plants
InputActivityRatio(r,'OIL_GEN','OIL',"1",y) = 1/0.2;
OutputActivityRatio(r,'OIL_GEN','ELC',"1",y) = 1;

** oil refineries
InputActivityRatio(r,'SRE','OIL',"1",y) = 1.1;
OutputActivityRatio(r,'SRE','GSL',"1",y) = 0.7;
OutputActivityRatio(r,'SRE','DSL',"1",y) = 0.3;

# Characterize ELECTROLIZERS
AvailabilityFactor(r,'HEL',y) = 0.9;
OperationalLife(r,'HEL') = 10;
CapitalCost(r,'HEL',y) = 1;
VariableCost(r,'HEL',m,y) = 0;
FixedCost(r,'HEL',y) = 0;

# characterize dam hydro storage
CapacityFactor(r,'STOR_HYDRO',"ID",y) = 0.7;
CapacityFactor(r,'STOR_HYDRO',"IN",y) = 0.7;
CapacityFactor(r,'STOR_HYDRO',"SD",y) = 0.3;
CapacityFactor(r,'STOR_HYDRO',"SN",y) = 0.3;
CapacityFactor(r,'STOR_HYDRO',"WD",y) = 0.5;
CapacityFactor(r,'STOR_HYDRO',"WN",y) = 0.5;
CapitalCost(r,'STOR_HYDRO',y) = 1000;
VariableCost(r,'STOR_HYDRO',m,y) = 0;
FixedCost(r,'STOR_HYDRO',y) = 0;
OperationalLife(r,'STOR_HYDRO') = 10;
ResidualCapacity(r,"STOR_HYDRO",y) = 7.25;

CapitalCostStorage(r,'HYDROGEN',y) = 100;
ResidualStorageCapacity(r,'HYDROGEN',y) = 0;
StorageLevelStart(r,'HYDROGEN') = 0;

CapitalCostStorage(r,'DAM',y) = 100;
ResidualStorageCapacity(r,'DAM',y) = 999;
StorageLevelStart(r,'DAM') = 999;

InputActivityRatio(r,'HEL','ELC',"1",y) = 2; #IEA convention
OutputActivityRatio(r,'HEL','ELC',"2",y) = 0.6; #IEA convention

InputActivityRatio(r,'STOR_HYDRO','ELC',"2",y) = 1; #IEA convention
OutputActivityRatio(r,'STOR_HYDRO','ELC',"1",y) = 1; #IEA convention

TechnologyToStorage(r,"1",'HEL','HYDROGEN') = 1;
TechnologyFromStorage(r,"2",'HEL','HYDROGEN') = 1;

TechnologyToStorage(r,"2",'STOR_HYDRO','DAM') = 1;
TechnologyFromStorage(r,"1",'STOR_HYDRO','DAM') = 1;































*------------------------------------------------------------------------	
* Parameters - Performance       
*------------------------------------------------------------------------

CapacityToActivityUnit(r,t)$power_plants(t) = 31.536;

CapacityToActivityUnit(r,t)$(CapacityToActivityUnit(r,t) = 0) = 1;

CapacityFactor(r,t,l,y)$(CapacityFactor(r,t,l,y) = 0) = 1;
AvailabilityFactor(r,t,y)$(AvailabilityFactor(r,t,y) = 0) = 1;

OperationalLife(r,t)$(OperationalLife(r,t) = 0) = 1;

*------------------------------------------------------------------------	
* Parameters - Technology costs       
*------------------------------------------------------------------------

VariableCost(r,t,m,y)$(VariableCost(r,t,m,y) = 0) = 1e-5;

*------------------------------------------------------------------------	
* Parameters - Storage       
*------------------------------------------------------------------------

StorageMaxChargeRate(r,s) = 99;

StorageMaxDischargeRate(r,s) = 99;

MinStorageCharge(r,s,y) = 0;

OperationalLifeStorage(r,s) = 99;

CapitalCostStorage(r,s,y) = 0;

ResidualStorageCapacity(r,s,y) = 999;



*------------------------------------------------------------------------	
* Parameters - Capacity and investment constraints       
*------------------------------------------------------------------------

CapacityOfOneTechnologyUnit(r,t,y) = 0;

parameter TotalAnnualMaxCapacity /

/;
TotalAnnualMaxCapacity(r,t,y)$(TotalAnnualMaxCapacity(r,t,y) = 0) = 99999;

parameter TotalAnnualMinCapacity(r,t,y) /

/;

TotalAnnualMaxCapacityInvestment(r,t,y) = 99999;

TotalAnnualMinCapacityInvestment(r,t,y) = 0;


*------------------------------------------------------------------------	
* Parameters - Activity constraints       
*------------------------------------------------------------------------

TotalTechnologyAnnualActivityUpperLimit(r,t,y) = 99999;

TotalTechnologyAnnualActivityLowerLimit(r,t,y) = 0;

TotalTechnologyModelPeriodActivityUpperLimit(r,t) = 99999;

TotalTechnologyModelPeriodActivityLowerLimit(r,t) = 0;


*------------------------------------------------------------------------	
* Parameters - Reserve margin
*-----------------------------------------------------------------------

ReserveMarginTagTechnology(r,t,y)$(not renewable_tech(t)) = 1;

ReserveMarginTagFuel(r,"ELC",y) = 1;  #electricity

ReserveMargin(r,y) = 1.18;


*------------------------------------------------------------------------	
* Parameters - RE Generation Target       
*------------------------------------------------------------------------

RETagTechnology(r,t,y) = 0;

RETagFuel(r,f,y) = 0;

REMinProductionTarget(r,y) = 0;


*------------------------------------------------------------------------	
* Parameters - Emissions       
*------------------------------------------------------------------------

EmissionsPenalty(r,e,y) = 0;

AnnualExogenousEmission(r,e,y) = 0;

AnnualEmissionLimit(r,e,y) = 9999;

ModelPeriodExogenousEmission(r,e) = 0;

ModelPeriodEmissionLimit(r,e) = 9999;