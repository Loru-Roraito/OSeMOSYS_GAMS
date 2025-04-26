$set phase %1

**------------------------------------------------------------------------	
$ifthen.ph %phase%=='sets'

set     TECHNOLOGY      /
        RHE 'Residential heating - electric'
        RL1 'Residential lighting'
        RC1 'Residential cooling'
        TXE 'Personal vehicles - electric'
        IHE 'Industrial heating - electric'
        MEL 'melting'
        FRO 'forming' /;

set    FUEL            /
        RH 'Demand for residential heating'
        RL 'Demand for residential lighting'
        RC 'Demand for residential cooling'
        IH 'Demand for industrial heating'
        TX 'Demand for personal transport' 
        IM 'Ice demand'
        FI 'Ice forming' /;

$elseif.ph %phase%=='data' 
*------------------------------------------------------------------------	
* Parameters - Demands       
*------------------------------------------------------------------------
scalar fen_2025;
fen_2025 = 1400; #TWh

** italy: residential and commercial -> 26% + 12.5% OF FEN.
** assume: 50% heating, 20% cooling, 30% lighting
SpecifiedAnnualDemand(r,"RH",y) = 0.38 * 0.5 * fen_2025;
SpecifiedAnnualDemand(r,"RC",y) = 0.38 * 0.2 * fen_2025;
SpecifiedAnnualDemand(r,"RL",y) = 0.38 * 0.3 * fen_2025;
SpecifiedAnnualDemand(r,"IH",y) = 0.21 * fen_2025;
AccumulatedAnnualDemand(r,"TX",y) = 0.33 * fen_2025;

AccumulatedAnnualDemand(r,"IM",y) = 10;
AccumulatedAnnualDemand(r,"FI",y) = 5;
equation MeltedIceBalance;

parameter SpecifiedDemandProfile(r,f,l,y) /
  ITALY.RH.ID.(%yearstart%*%yearend% )  .12
  ITALY.RH.IN.(%yearstart%*%yearend% )  .06
  ITALY.RH.SD.(%yearstart%*%yearend% )  0
  ITALY.RH.SN.(%yearstart%*%yearend% )  0
  ITALY.RH.WD.(%yearstart%*%yearend% )  .5467
  ITALY.RH.WN.(%yearstart%*%yearend% )  .2733
  ITALY.RL.ID.(%yearstart%*%yearend% )  .15
  ITALY.RL.IN.(%yearstart%*%yearend% )  .05
  ITALY.RL.SD.(%yearstart%*%yearend% )  .15
  ITALY.RL.SN.(%yearstart%*%yearend% )  .05
  ITALY.RL.WD.(%yearstart%*%yearend% )  .5
  ITALY.RL.WN.(%yearstart%*%yearend% )  .1
  ITALY.RC.ID.(%yearstart%*%yearend% )  .3
  ITALY.RC.IN.(%yearstart%*%yearend% )  0
  ITALY.RC.SD.(%yearstart%*%yearend% )  .5
  ITALY.RC.SN.(%yearstart%*%yearend% )  .2
  ITALY.RC.WD.(%yearstart%*%yearend% )  0
  ITALY.RC.WN.(%yearstart%*%yearend% )  0
  ITALY.IH.ID.(%yearstart%*%yearend% )  .3
  ITALY.IH.IN.(%yearstart%*%yearend% )  .033
  ITALY.IH.SD.(%yearstart%*%yearend% )  .3
  ITALY.IH.SN.(%yearstart%*%yearend% )  .033
  ITALY.IH.WD.(%yearstart%*%yearend% )  .3
  ITALY.IH.WN.(%yearstart%*%yearend% )  .034
/;


*------------------------------------------------------------------------	
* Parameters - technologies       
*------------------------------------------------------------------------

##### END-USE TECHNOLOGIES
** residential heating technologies
CapitalCost(r,"RHE",y) = 1000;
VariableCost(r,"RHE",m,y) = 1e-5;
FixedCost(r,"RHE",y) = 0.1;
OperationalLife(r,"RHE") = 10;

** residential lighting and cooling
CapitalCost(r,"RL1",y) = 1000;
VariableCost(r,"RL1",m,y) = 1e-5;
FixedCost(r,"RL1",y) = 0.1;
OperationalLife(r,"RL1") = 10;

CapitalCost(r,"RC1",y) = 1000;
VariableCost(r,"RC1",m,y) = 1e-5;
FixedCost(r,"RC1",y) = 0.1;
OperationalLife(r,"RC1") = 10;

** personal transport
* assuming 25k for a diesel car, 22k for a gasoline car, and 35k for an electric car
* fixed costs (insurance, taxes, etc.) are 2k for diesel and gasoline, and 1.5k for electric

CapitalCost(r,"TXE",y) = 35e-6;
VariableCost(r,"TXE",m,y) = 0;
FixedCost(r,"TXE",y) = 1.5e-6;
OperationalLife(r,"TXE") = 12;

** industrial heating technologies
CapitalCost(r,"IHE",y) = 1000;
VariableCost(r,"IHE",m,y) = 1e-5;
FixedCost(r,"IHE",y) = 0.1;
OperationalLife(r,"IHE") = 10;

*------------------------------------------------------------------------
$elseif.ph %phase%=='popol'

#template (efficiencies should be populated correctly)

** residential heating technologies
InputActivityRatio(r,"RHE","ELC","1",y) = 1;
OutputActivityRatio(r,"RHE","RH","1",y) = 1;

** residential lighting and cooling
InputActivityRatio(r,"RL1","ELC","1",y) = 1;
InputActivityRatio(r,"RC1","ELC","1",y) = 1;
OutputActivityRatio(r,"RL1","RL","1",y) = 1;
OutputActivityRatio(r,"RC1","RC","1",y) = 1;

** personal transport
# here you want to the energy expenditure of one car in one year travelling 10000 kms
# 1 car consumes 10000km * l/km * TWh/l 
* ELECTRIC: 10000 km/yr * 0.135 kWh/km * 1e-9 TWh/kWh 
InputActivityRatio(r,"TXE","ELC","1",y) = 1.35e-6;

# switch from number of cars to thousands of chilometers travelled
OutputActivityRatio(r,"TXE","TX","1",y) = 10; # average thousands km travelled per year: 10

** industrial heating technologies
InputActivityRatio(r,"IHE","ELC","1",y) = 1;
# demand for industrial heating is thermal
OutputActivityRatio(r,"IHE","IH","1",y) = 1;

InputActivityRatio(r,"MEL","ICE_MEL","1",y) = 1;
OutputActivityRatio(r,"MEL","IM","1",y) = 1;

InputActivityRatio(r,"FRO","ICE_PROD","1",y) = 1;
OutputActivityRatio(r,"FRO","FI","1",y) = 1;

$endif.ph