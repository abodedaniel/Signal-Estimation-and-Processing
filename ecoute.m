function ecoute

load synthe22
z=zeros(1,10000);
a=a/max(abs(a)); e=e/max(abs(e)); i=i/max(abs(i)); o=o/max(abs(o)); u=u/max(abs(u)); 
s=[a z e z i z o z u z];
a_synthe=a_synthe/max(abs(a_synthe)); e_synthe=e_synthe/max(abs(e_synthe));
i_synthe=i_synthe/max(abs(i_synthe)); o_synthe=o_synthe/max(abs(o_synthe));
u_synthe=u_synthe/max(abs(u_synthe)); 
s_synthe=[a_synthe z e_synthe z i_synthe z o_synthe z u_synthe z];
sound([s s_synthe],Fe);
