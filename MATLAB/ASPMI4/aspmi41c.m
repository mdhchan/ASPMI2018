% ASPMI Exercise 4.1c
% Generate two sets of complex voltages, one balanced and one unbalanced. 
% Plot the circularity diagrams of these complex ? ? ? voltages.

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
figure(1)
plot(real(v_balanced),imag(v_balanced));
title('Circularity Diagram for Balanced Voltage')
xlabel('Real')
ylabel('Imaginary')

% Use specific formula for balanced voltage
v_balanced_2 = zeros(N,1);
for n=1:N
    v_balanced_2(n) = sqrt(3/2)*Va(n)*exp(1i*(2*pi*f0*n/fs+phi));
end
figure(2)
plot(real(v_balanced_2),imag(v_balanced_2));
title('Circularity Diagram for Balanced Voltage')
xlabel('Real')
ylabel('Imaginary')

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
figure(3)
plot(real(v_unbalanced),imag(v_unbalanced));
title('Circularity Diagram for Unbalanced Voltage')
xlabel('Real')
ylabel('Imaginary')