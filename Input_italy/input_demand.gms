$set phase %1

**------------------------------------------------------------------------	
$ifthen.ph %phase%=='sets'

set     TECHNOLOGY      /
        ELT 'Electricity' 
        MEL 'Ice melting'
        FRO 'Ice forming'/;

set    FUEL            /
        ED 'Demand for electricity'
        IM 'Ice demand'
        FI 'Ice forming' /;

$elseif.ph %phase%=='data' 
*------------------------------------------------------------------------	
* Parameters - Demands       
*------------------------------------------------------------------------
scalar fen_2025;
fen_2025 = 1000; #TWh

AccumulatedAnnualDemand(r,"ED",y) = fen_2025;

AccumulatedAnnualDemand(r,"IM",y) = melting_rate(y);
AccumulatedAnnualDemand(r,"FI",y) = forming_rate(y);

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

*------------------------------------------------------------------------
$elseif.ph %phase%=='popol'

#template (efficiencies should be populated correctly)

InputActivityRatio(r,"ELT","ELC","1",y) = 1;
OutputActivityRatio(r,"ELT","ED","1",y) = 1;

InputActivityRatio(r,"MEL","ICE_MEL","1",y) = 1;
OutputActivityRatio(r,"MEL","IM","1",y) = 1;

InputActivityRatio(r,"FRO","ICE_PROD","1",y) = 1;
OutputActivityRatio(r,"FRO","FI","1",y) = 1;

$endif.ph