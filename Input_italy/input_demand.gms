$set phase %1

**------------------------------------------------------------------------	
$ifthen.ph %phase%=='sets'

set     TECHNOLOGY      /
        ELT 'Electricity' 
        MEL 'Ice melting'
        FRO 'Ice forming'
        DMW 'Dam water from glaciers'
        DMI  'Dam water from rain'/;

set    FUEL            /
        ED 'Demand for electricity'
        IM 'Ice demand'
        FI 'Ice forming' 
        ID 'glacier input'
        RD 'rain input'/;

$elseif.ph %phase%=='data' 
*------------------------------------------------------------------------	
* Parameters - Demands       
*------------------------------------------------------------------------
scalar el_2015;
el_2015 = 282.200; #TWh

AccumulatedAnnualDemand(r,"ED",y) = el_2015 + el_2015*0.02*(ord(y)-1) - el_2015*0.02*8; #TWh
AccumulatedAnnualDemand(r,"ED",YEAR)$(ycurrent(YEAR)) = el_2015; #TWh

AccumulatedAnnualDemand(r,"IM",y) = melting_rate(y);
AccumulatedAnnualDemand(r,"FI",y) = forming_rate(y);
AccumulatedAnnualDemand(r,"ID",y) = melting_rate(y)*%dampercentage%;
AccumulatedAnnualDemand(r,"RD",y) = %rains%;

parameter SpecifiedAnnualDemand(r,f,y) /

/;

parameter SpecifiedDemandProfile(r,f,l,y)/

/;


*------------------------------------------------------------------------	
* Parameters - technologies       
*------------------------------------------------------------------------

##### END-USE TECHNOLOGIES
CapitalCost(r,"ELT",y) = 0;
VariableCost(r,"ELT",m,y) = 0;
FixedCost(r,"ELT",y) = 0;
OperationalLife(r,"ELT") = 999;

CapitalCost(r,"MEL",y) = 0;
VariableCost(r,"MEL",m,y) = 0;
FixedCost(r,"MEL",y) = 0;
OperationalLife(r,"MEL") = 999;

CapitalCost(r,"FRO",y) = 0;
VariableCost(r,"FRO",m,y) = 0;
FixedCost(r,"FRO",y) = 0;
OperationalLife(r,"FRO") = 999;

CapitalCost(r,"DMW",y) = 0;
VariableCost(r,"DMW",m,y) = 0;
FixedCost(r,"DMW",y) = 0;
OperationalLife(r,"DMW") = 999;

CapitalCost(r,"DMI",y) = 0;
VariableCost(r,"DMI",m,y) = 0;
FixedCost(r,"DMI",y) = 0;
OperationalLife(r,"DMI") = 999;

*------------------------------------------------------------------------
$elseif.ph %phase%=='popol'

#template (efficiencies should be populated correctly)

InputActivityRatio(r,"ELT","ELC","1",y) = 1;
OutputActivityRatio(r,"ELT","ED","1",y) = 1;

InputActivityRatio(r,"MEL","ICE_MEL","1",y) = 1;
OutputActivityRatio(r,"MEL","IM","1",y) = 1;

InputActivityRatio(r,"FRO","ICE_PROD","1",y) = 1;
OutputActivityRatio(r,"FRO","FI","1",y) = 1;

InputActivityRatio(r,"DMW","WAT_DAM","1",y) = 1;
OutputActivityRatio(r,"DMW","ID","1",y) = 1;

InputActivityRatio(r,"DMI","WAT_IN","1",y) = 1;
OutputActivityRatio(r,"DMI","RD","1",y) = 1;

$endif.ph