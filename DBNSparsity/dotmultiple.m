function result=dotmultiple(y,x)

global countmul countzero;

[m,n]=size(x);
[l,k]=size(y);
accuracy=2^-8;
result=zeros(size(x,1),size(x,2));
if (l==1 && k==1)
for a=1:m
            for b=1:n 
                     countmul=countmul+1;
               if (abs(x(a,b))<accuracy)  && (abs(y)<accuracy)  
                      countzero=countzero+1;
                      result(a,b)=0;
               else
                      result(a,b)=x(a,b)*y;
               end
            end
end
elseif (m==l && k==n) 
    for a=1:m
            for b=1:n 
                     countmul=countmul+1;
               if  (abs(x(a,b))<accuracy)  && (abs(y(a,b))<accuracy)
                      countzero=countzero+1;
                      result(a,b)=0;
               else
                   result(a,b)=x(a,b)*y(a,b); 
               end
            end
    end
else
    error('error of dimention in dotmultiple');
end
    
end