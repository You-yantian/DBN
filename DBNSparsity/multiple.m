function result=multiple(x,y)

global countmul countzero;

accuracy=2^-8;
result=zeros(size(x,1),size(y,2));
 for a=1:size(x,1)
      for c=1:size(y,2)
            for b=1:size(x,2) 
                     countmul=countmul+1;
               if (abs(x(a,b))<accuracy)  && (abs(y(b,c))<accuracy)
                      countzero=countzero+1;
                      tempvalue=0;
               else
                   tempvalue=x(a,b)*y(b,c);
               end
                  result(a,c)=result(a,c)+tempvalue;
            end
      end
 end
end