function [LQi,Lci] = decodeLogDomain_box_plus_quantizer(H,iteration,Lci,range,out,factor)
% Box_plus decoder with quantization method
%
%Input:
%  Lci        : A prior Information
%  H          : LDPC matrix
%  N0         : Noise variance
%  iteration  : Number of iteration
%  d,NN,delta : The quantization parameters in the paper
%
%Output:
%  LQi        : A posterior Information
%
% Author: Zhichao Shao 

% get size from the parity check matrix
[M,N] = size(H);
LQi = zeros(1,N);
vHat = zeros(1,N);

%¨Quantization
Lci = decoder_quantizer(Lci*factor,range,out,1);

% Asscociate the L(ci) matrix with non-zero elements of H
Lqij = H.*repmat(Lci, M, 1);

% Initialization
Lrji = zeros(M, N);

% Iteration
for n = 1:iteration
   
   % ----- Horizontal step -----
   for i = 1:M
      
      % Find non-zeros in the column
      c1 = find(H(i, :));
      % Update
      Lrji(i, c1) = horizontal_step(Lqij(i,c1));
      % Quantization
      for k = 1:length(c1)
          Lrji(i, c1(k)) = decoder_quantizer(Lrji(i, c1(k)),range,out,2);
      end
   end % for i

   % ------ Vertical step ------
   for j = 1:N

      % Find non-zero in the row
      r1 = find(H(:, j));
      
      for k = 1:length(r1)        
         % Update
         Lqij(r1(k), j) = Lci(j) + sum(Lrji(r1, j)) - Lrji(r1(k), j);
         % Quantization
         Lqij(r1(k), j) = decoder_quantizer(Lqij(r1(k), j),range,out,2);
      end % for k
      
      % Get L(Qi)
      LQi(j) = Lci(j) + sum(Lrji(r1, j));
%       LQi(j) = decoder_quantizer(LQi(j),range,out,2); %delete is better
      % Decode L(Qi)
      if LQi(j) < 0
          vHat(j) = 1;
      else
          vHat(j) = 0;
      end
                  
   end % for j
   
   if sum(mod(vHat*H',2)) == 0
       break;
   end
   
end % for n

LQi = -LQi;