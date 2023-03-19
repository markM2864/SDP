clear;clc
%% Setup input
input_msg   = [1 0 0 1 1 0 1 0 1 1 0 1 1 0 0 0 1 0 1 1];
data_len    = length(input_msg);
ctrl_start  = zeros(1,data_len);
ctrl_end    = zeros(1,data_len);
ctrl_valid  = ones(1,data_len);
ctrl_start(1) = 1;
ctrl_end(data_len) = 1;

%% Get result
fprintf("running simulation\n");
out = sim("CRC_example.slx");
