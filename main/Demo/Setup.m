close all; clear; clc
%% Setup input
input_msg   = [1 0 0 1 1 0 1 0 1 1 0 1 1 0 0 0 1 0 1 1];
data_len    = length(input_msg);
ctrl_start  = zeros(1,data_len);
ctrl_end    = zeros(1,data_len);
ctrl_valid  = ones(1,data_len);
ctrl_start(1) = 1;
ctrl_end(data_len) = 1;

BGN = false;
liftingSize = uint16(4);%Need fixing
liftingSize_zero = uint16(0);

%% Get result
fprintf("running simulation\n");
open_system('Connection.slx');
out = sim("Connection.slx");
fprintf("simulation complete\n");
