(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*data =Import["Git\\PlateNumber\\Cangzhou.csv", HeaderLines->1][[;;,2]]*)


(* ::Input:: *)
(*(*data=SemanticImportString[str][;;,"number"]//Normal*)*)


(* ::Input:: *)
(*numbers=Flatten@((Flatten@Table[StringInsert[StringInsert[#,ToString[i],3],ToString[j],-1],{i,0,9},{j,0,9}]&)/@data);*)


(* ::Input:: *)
(*(* \:7d20\:6570 *)*)


(* ::Input:: *)
(*Select[numbers,PrimeQ[FromDigits[#,36]]&]*)


(* ::Input:: *)
(*(* \:5361\:8fc8\:514b\:5c14\:6570\:ff0c\:5373\:5bf9\:4e8e\:6240\:6709\:4e0en\:4e92\:7d20\:7684\:6574\:6570b\:ff0c\:6ee1\:8db3b^(n-1)modn=1\:7684\:5408\:6210\:6570n *)*)


(* ::Input:: *)
(* cnumberQ[n_]:=!PrimeQ[n]&&Mod[n,CarmichaelLambda[n]]==1;*)


(* ::Input:: *)
(*Select[numbers,cnumberQ[FromDigits[#,36]]&]*)


(* ::Input:: *)
(*(* \:81f3\:5c11\:6709\:4e24\:4e2a\:7d20\:56e0\:5b50\:ff0c\:4e14\:6bcf\:4e2a\:7d20\:56e0\:5b50\:90fd\:5927\:4e8e2000\:7684\:6570 *)*)


(* ::Input:: *)
(*bigFactorQ[n_]:=!PrimeQ[n]&&And@@((#>2000)&/@FactorInteger[n][[;;,1]]);*)


(* ::Input:: *)
(*Select[numbers,bigFactorQ[FromDigits[#,36]]&]*)


(* ::Input:: *)
(*(* \:4f2a\:7d20\:6570 *)*)


(* ::Input:: *)
(*pseudoPrimeQ[n_,a_:2]:=!PrimeQ[n]&&PowerMod[a,n-1,n]==1*)


(* ::Input:: *)
(*Flatten@Table[Select[numbers,pseudoPrimeQ[FromDigits[#,36],i]&],{i,2,2000}]*)


(* ::Input:: *)
(*Counts[%]//ReverseSort*)
