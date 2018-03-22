% ASPMI Exercise 4.1e
% Use the CLMS ACLMS algorithms to estimate the frequency of the voltages 
% generated in Part 4.1c

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate two sets of complex voltages - one balanced, one unbalanced
% Common Parameters
N = 1000;
f0 = 50;
fs = 1000;
phi = 0;

% Balanced voltage parameters
Va = 100*ones(N,1);
Vb = 100*ones(N,1);
Vc = 100*ones(N,1);
deltab_deg = 0;
deltac_deg = 0;
deltab = deltab_deg*pi/180;
deltac = deltac_deg*pi/180;

% Use general formula
A_balanced = zeros(N,1);
B_balanced = zeros(N,1);
v_balanced = zeros(N,1);
for n=1:N 
    A_balanced(n) = (sqrt(6)/6)*(Va(n) + ...
            Vb(n)*exp(1i*deltab) + ...
            Vc(n)*exp(1i*deltac));
    B_balanced(n) = (sqrt(6)/6)*(Va(n) + ...
            Vb(n)*exp(-1i*(deltab+2*pi/3)) + ... 
            Vc(n)*exp(-1i*(deltac-2*pi/3)) );
    v_balanced(n) = A_balanced(n)*exp(1i*(2*pi*f0*n/fs+phi)) + ...
            B_balanced(n)*exp(-1i*(2*pi*f0*n/fs+phi));
end

% Unbalanced voltage parameters
Va_2 = 100*ones(N,1);
Vb_2 = 50*ones(N,1);
Vc_2 = 100*ones(N,1);
deltab_deg_2 = 20;
deltac_deg_2 = 0;
deltab_2 = deltab_deg_2*pi/180;
deltac_2 = deltac_deg_2*pi/180;

% Use general formula
A_unbalanced = zeros(N,1);
B_unbalanced = zeros(N,1);
v_unbalanced = zeros(N,1);
for n=1:N 
    A_unbalanced(n) = (sqrt(6)/6)*(Va_2(n) + ...
            Vb_2(n)*exp(1i*deltab_2) + ...
            Vc_2(n)*exp(1i*deltac_2));
    B_unbalanced(n) = (sqrt(6)/6)*(Va_2(n) + ...
            Vb_2(n)*exp(-1i*(deltab_2+2*pi/3)) + ... 
            Vc_2(n)*exp(-1i*(deltac_2-2*pi/3)) );
    v_unbalanced(n) = A_unbalanced(n)*exp(1i*(2*pi*f0*n/fs+phi)) + ...
            B_unbalanced(n)*exp(-1i*(2*pi*f0*n/fs+phi));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
order = 1;

% Estimate balanced voltage
% Use CLMS
mu = 0.01;
[~,e_clms_balanced,clms_hmat] = ar_clms(v_balanced,mu,order);
f_balanced_estimate_clms = fs*atan(imag(clms_hmat)./real(clms_hmat))./(2*pi);
f_balanced_estimate_clms = real(f_balanced_estimate_clms);
figure(1)
plot(f_balanced_estimate_clms);

% Use ACLMS
mu = 1e-5;
[~,e_aclms_balanced,aclms_hmat,aclms_gmat ] = ar_aclms(v_balanced,mu,order);
f_balanced_estimate_aclms = fs*...
    atan(sqrt(imag(aclms_hmat).^2-abs(aclms_gmat).^2)./real(aclms_hmat))./...
    (2*pi);
f_balanced_estimate_aclms = real(f_balanced_estimate_aclms);
figure(2)
plot(real(f_balanced_estimate_aclms));

% Estimate unbalanced voltage
% Use CLMS
mu = 0.01;
[~,e_clms_unbalanced,clms_hmat] = ar_clms(v_unbalanced,mu,order);
f_unbalanced_estimate_clms = fs*atan(imag(clms_hmat)./real(clms_hmat))./(2*pi);
f_unbalanced_estimate_clms = real(f_unbalanced_estimate_clms);
figure(3)
plot(f_unbalanced_estimate_clms);

% Use ACLMS
mu = 1e-5;
[~,e_aclms_unbalanced,aclms_hmat,aclms_gmat ] = ar_aclms(v_unbalanced,mu,order);
f_unbalanced_estimate_aclms = fs*...
    atan(sqrt(imag(aclms_hmat).^2-abs(aclms_gmat).^2)./real(aclms_hmat))./...
    (2*pi);
f_unbalanced_estimate_aclms = real(f_unbalanced_estimate_aclms);
figure(4)
plot(f_unbalanced_estimate_aclms);