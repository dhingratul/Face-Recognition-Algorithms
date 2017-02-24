function[outlabel] = outputlabel(W,mu,labeltr,train,labelte,test,k)
%% Recognition
outlabel=[];
for j=1:length(labelte)
    P_tr= project (W (: , 4:k ) , train , mu ) ;
    P_tr = reconstruct (W (: , 4:15 ) ,P_tr , mu );
    P_te = project (W (: , 4:k ) , test (j ,:) , mu ) ;
    P_te = reconstruct (W (: , 4:15 ) ,P_te , mu );
    similarity_score = arrayfun(@(n) 1 / (1 + norm(P_tr(n,:) - P_te(1,:))), 1:length(labeltr));
    [match_score, match_ix] = max(similarity_score);
    temp=labeltr(match_ix,1);
    % display the result
    outlabel=[outlabel;temp];   
end
end