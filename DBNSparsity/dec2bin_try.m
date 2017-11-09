a=nn.a{1,1}(1,2:785);
W=nn.W{1,1}';
W=W(2:785,1:100);
A=a(1,113:128);%A:1*16
B=W(113:128,1:16);%B:16*16
for i=1:16
   Abin{1,i}=dectobin2(A(1,i),16);
end

for j=1:16
    for i=1:16
        Bbin{j,i}=dectobin2(B(j,i),16);
    end
end

for j=1:16
    for i=1:16
        if (Bbin{i,j}(1,1)=='1')
           Cbin{i,j}=dec2bin(bin2dec(Bbin{i,j})+1);
        else
            Cbin{i,j}=Bbin{i,j};
        end
    end
end


fid=fopen('data_16bits.txt','wt');%????????.txt??
temp=fscanf(fid,'%x');%????
n=16;
fid=fopen('convert_data.mif','w');%??????.mif??
fid=fopen('data_8bits.txt','wt');%????????.txt??
fid=fopen('weight_16bits1.txt','wt');%????????.txt??
fprintf(fid,'WIDTH=16;\n');%??????8?
fprintf(fid,'DEPTH=784;\n');%??????1024
fprintf(fid,'ADDRESS_RADIX=UNS;\n');%????????????
fprintf(fid,'DATA_RADIX=BIN;\n');%???????16??
fprintf(fid,'CONTENT BEGIN\n');%????
for i=1:16
fprintf(fid,'\t%d:%s;\n',(i-1),Abin{1,i});
end
fprintf(fid,'END;\n');
fclose(fid);%????




fid=fopen('weight_16bits1.txt','wt');%????????.txt??
fprintf(fid,'WIDTH=16;\n');%??????16?
fprintf(fid,'DEPTH=16;\n');%??????16
fprintf(fid,'ADDRESS_RADIX=UNS;\n');%????????????
fprintf(fid,'DATA_RADIX=BIN;\n');%???????2??
fprintf(fid,'CONTENT BEGIN\n');%????
for i=1:16
fprintf(fid,'\t%d:%s;\n',(i-1),Cbin{i,1});
end
fprintf(fid,'END;\n');
fclose(fid);%????
%%   ------------------------------------------------
fid=fopen('data_16bits.txt','wt');%????????.txt??
for i=1:16
fprintf(fid,'%s\n',Abin{1,i});
end
fclose(fid);%????

%%  weight_buffer read in
fid=fopen('weight_16bits.txt','wt');%????????.txt??
for i=1:16
    for j=1:16
    fprintf(fid,'%s',Cbin{j,i});
    end
    fprintf(fid,'\n');
end
fclose(fid);%????


