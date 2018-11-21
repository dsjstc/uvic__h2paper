function [fitresult, gof] = wcplot(P, Wc)
%CREATEFIT(P,WC)
%  Create a fit.
%
%  Data for 'Reversible isothermal compression' fit:
%      X Input : P
%      Y Output: Wc
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 08-Nov-2018 15:20:33


%% Fit: 'Reversible isothermal compression'.
[xData, yData] = prepareCurveData( P, Wc );

% Set up fittype and options.
ft = fittype( 'power2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.40488968673699 0.279423321840525 -0.0255975053730537];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Reversible isothermal compression' );
h = plot( fitresult, xData, yData );
legend( h, 'Computed work', 'Fitted curve', 'Location', 'NorthEast' );
% Label axes
xlabel('P (bar)')
ylabel('Wc (kWh)')
grid on

