
% a query requiring the ternary relation
%   select the set of suppliers that supply part3 to proj3

query :-
    % can do help(bagof) in swi-prolog
    bagof(Supplier, Amt^supply(Supplier, part3, proj3, Amt), SupplierList),
    print(SupplierList).

% a bad attempt to find the suppliers that actually supply part3 to proj3
badquery :-
    bagof(Supplier, (can_supply(Supplier,part3), uses(proj3,part3)), SupplierList),
    print(SupplierList).


% the 3 basic entity relations

supplier(supp1).
supplier(supp2).
supplier(supp3).
supplier(supp4).

project(proj1).
project(proj2).
project(proj3).
project(proj4).
project(proj6).

part(part1).
part(part2).
part(part3).
part(part4).
part(part5).
part(part6).

% the ternary relation

supply(supp2,part3,proj3,555).
supply(supp2,part4,proj3,444).
supply(supp3,part1,proj1,888).
supply(supp3,part3,proj3,888).
supply(supp4,part3,proj3,10).
supply(supp4,part3,proj1,9).
supply(supp4,part5,proj2,77).


% the 3 NON-equivalent binary relations
%   note that every supplier can_supply every part in this data

supplies(supp2,proj3).
supplies(supp3,proj3).
supplies(supp3,proj1).
supplies(supp4,proj1).
supplies(supp4,proj2).
supplies(supp4,proj3).

uses(proj1,part3).
uses(proj3,part3).
uses(proj3,part4).
uses(proj2,part5).

can_supply(supp1,part1).
can_supply(supp1,part2).
can_supply(supp1,part3).
can_supply(supp1,part4).
can_supply(supp1,part5).
can_supply(supp1,part6).
can_supply(supp2,part1).
can_supply(supp2,part2).
can_supply(supp2,part3).
can_supply(supp2,part4).
can_supply(supp2,part5).
can_supply(supp2,part6).
can_supply(supp3,part1).
can_supply(supp3,part2).
can_supply(supp3,part3).
can_supply(supp3,part4).
can_supply(supp3,part5).
can_supply(supp3,part6).
can_supply(supp4,part1).
can_supply(supp4,part2).
can_supply(supp4,part3).
can_supply(supp4,part4).
can_supply(supp4,part5).
can_supply(supp4,part6).
