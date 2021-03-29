%% Détermination des dimensions de l'échangeur de chaleur à partir d'un UA de 800
clear
clc
%Dimensions
Dp_i= 0.045; %m
Dp_e= 0.048; %m (épaisseur de 1.5mm)
N=20; %(nombres de tuyaux intérieurs)
Dg_i=0.5; %m
L=4.5; %m

Ap_i=pi*Dp_i*L; %m^2
Ap_e=pi*Dp_e*L; %m^2
Ag_i=pi*Dg_i*L; %m^2

% Propriété des fluides
% Densité
rho_MDI = 1250; %[kg/m^3]
rho_Poly = 1210; %[kg/m^3]
rho_H2O = 1034; %[kg/m^3]

% Conductivité thermique
k_MDI = 0.08648; % [W/m K]
k_Poly = 0.1557; % [W/m K]
k_H2O = 0.147; % [W/m K]
k_acier = 36; % [W/m K]

% Chaleur spécifique
cp_MDI = 1800; % [J/kg K]
cp_Poly = 2270; % [J/kg K]
cp_H2O = 3915; % [J/kg K]

% Viscosités dynamiques
visc_MDI = 0.19; % [Ns/m^2]
visc_H2O = 0.042; % Viscosité du Propylène Glycol [Ns/m^2]

% Débit des fluides
debit_MDI = 35/(1000*60); % [m^3/s] valeur maximale de sortie
debit_Poly = 17/(1000*60); % [m^3/s] valeur maximale de sortie
debit_H2O = 0.005; % [m^3/s] valeur déterminé sur la courbe de pompe

%Nombre de Prandlt
Pr_MDI=visc_MDI*cp_MDI/k_MDI;
Pr_H2O=visc_H2O*cp_H2O/k_H2O;

%Résistance de convection interne des petits tuyaux
%(Eau-glycol qui circule dans les petits tuyaux)
Re_p_i=(4*rho_H2O*debit_H2O)/(pi*N*Dp_i*visc_H2O);
%Laminaire (Re plus petit que 2300) 
%Turbulent (Re plus grand que 2300)
if Re_p_i < 2300
    Nu_p_i=4.36;
else
    Nu_p_i=0.023*(Re_p_i^(4/5))*(Pr_H2O^0.4); %n=0.4 parce que température de surface est plus chaude que température intérieure
end
h_p_i=Nu_p_i*k_H2O/Dp_i;
R_conv_i=1/(h_p_i)*Ap_i;

%Résistance de conduction des petits tuyaux
R_cond=(log(Dp_e/Dp_i))/(2*pi*L*k_acier);

%Résistance de convection externe des petits tuyaux
%(MDI qui a un effet convectif sur l'extérieur des petits tuyaux.)
%Aire et diamètre équivalent
Aeq=((pi*Dg_i^2)/4)-N*((pi*Dp_e^2)/4);
Deq=(Aeq*4/pi)^(1/2);
Re_p_e=(4*rho_MDI*debit_MDI)/(pi*N*Deq*visc_MDI);
V=debit_MDI/Aeq;

if Re_p_e < 2300
     Nu_p_e=4.36;
else
    Nu_p_e=0.023*(Re_p_e^(4/5))*(Pr_MDI^0.3); %n=0.3 parce que température de surface est plus froide que température intérieure
end
h_p_e=Nu_p_e*k_MDI/Dp_e;
R_conv_e=1/(h_p_e)*(Ap_e);
    
%Résistance totale des petits tuyaux
%(20 tuyaux enb parallèle)
R_tot=N*(1/R_cond + 1/R_conv_e + 1/R_conv_i)^(-1);
UA=1/R_tot;

%La convection externe est négligée, ce qui sous-entend que l'échangeur est
%isolé. On ne calcule donc pas la convection du MDI sur la parois intérieur
%du gros tuyaux, ni la conduction dans le gros tuyau.


