$set phase %1

**------------------------------------------------------------------------	
$ifthen.ph %phase%=='sets'

set     TECHNOLOGY      /
        ELT 'Electricity' 
        MEL 'Ice melting'
        DMW 'Dam water from glaciers'
        DMI  'Dam water from rain'/;

set    FUEL            /
        ED 'Demand for electricity'
        IM 'Ice demand'
        DI 'glacier input'
        RD 'rain input'/;

$elseif.ph %phase%=='data' 
*------------------------------------------------------------------------	
* Parameters - Demands       
*------------------------------------------------------------------------
scalar el_2015;
el_2015 = 282.200; #TWh

AccumulatedAnnualDemand(r,"ED",y) = el_2015 + el_2015*0.02*(ord(y)-1) - el_2015*0.02*8; #TWh
AccumulatedAnnualDemand(r,"ED",YEAR)$(ycurrent(YEAR)) = el_2015; #TWh

SpecifiedAnnualDemand(r,"IM",y) = melting_rate(y);
AccumulatedAnnualDemand(r,"RD",y) = %rains%;


parameter SpecifiedDemandProfile(r,f,l,y)/
  ITALY.IM.ID.(%yearstart%*%yearend%)  .18
  ITALY.IM.IN.(%yearstart%*%yearend%)  .12
  ITALY.IM.SD.(%yearstart%*%yearend%)  .30
  ITALY.IM.SN.(%yearstart%*%yearend%)  .20
  ITALY.IM.WD.(%yearstart%*%yearend%)  .10
  ITALY.IM.WN.(%yearstart%*%yearend%)  .10
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

InputActivityRatio(r,"DMW","WAT_DAM","1",y) = 1;
OutputActivityRatio(r,"DMW","DI","1",y) = 1;

InputActivityRatio(r,"DMI","WAT_IN","1",y) = 1;
OutputActivityRatio(r,"DMI","RD","1",y) = 1;

$endif.ph