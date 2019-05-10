set D; #基地の集合
set P; #現場の集合
set N; #レイヤの集合   
set V; #車両の集合
set S; #日の集合


var z_delay{S,V,N} >=0;  #到着時刻と通報時刻の差を表す0-1変数
var y{D,V} binary;  #車両Kは基地Iに所属する0-1変数
var x{S,P,V,N} binary;#レイヤNで車両Kは現場Jにサービスを提供する0-1変数
var z_return{S,V,N}>=0;       #基地へ戻る時刻
var z_arrival{S,V,N}>=0;       #現場に到着時刻
var z_travel{S,V,N}>=0;   #レイヤNに到着までの所要時間
var z_dispatch{S,V,N}>=0;       #出発時刻
var z_end{S,V,N}>=0;       #サービス完了時刻 
var z_dis{S,V,N};#先着車両と後着車両の到着時刻差の違反量

param t_travel{S,P,D} default 0;       #基地Iから現場Jまでの時間
param t_call{S,P} default 0;       #通報時刻
param t_service{S,P} default 0;         #現場での作業時間
param demand{S,P} default 0;       #現場の車両要求数
param M;                      #大きい定数
param t_setup{S,P} default 0;            #通常出発前の準備時間



minimize Objective:sum{s in S,n in N,v in V}z_delay[s,v,n]+sum{s in S,n in N,v in V}z_dis[s,v,n];

subject to C1{v in V}:   #車両の所属を決める
sum{d in D}y[d,v]==1;

subject to C2{s in S,n in N,v in V}: #各車両はそれぞれのレーヤで高々一つの現場に存在する 
sum{p in P}x[s,p,v,n]<=1;

subject to C3{p in P,s in S}:   #現場の車両要求数を満たす
demand[s,p]==sum{v in V,n in N}x[s,p,v,n];

subject to C4{s in S,n in N,v in V}: #車両Kは現場Jへの出動回数は高々一回
sum{n in N}x[s,p,v,n]<=1;

subject to C5{s in S,n in N,v in V}: #現場への到着時刻の制約
z_arrival[s,v,n]==z_dispatch[s,v,n]+z_travel[a,v,n];

subject to C7{s in S,n in N,v in V:n>=2}: #次の現場への出発時刻は前の車両が基地へ戻る時刻より以上
z_return[s,v,n-1]+sum{p in P}x[s,p,v,n]*z_setup[s,p]<=c[s,v,n];

subject to C8{s in S,p in P,d in D,n in N,v in V}: #基地と現場の移動時間を表す
z_travel[s,v,n]>=t_travel[s,p,d]-(1-x[s,p,v,n])*M-(1-y[d,v])*M;

subject to C9{s in S,n in N,v in V}: #現場での作業時刻の表現
z_end[s,v,n]==z_arrival[s,v,n]+sum{p in P}x[a,p,v,n]*t_service[s,v]-z_dis[s,v,n];

subject to C10{s in S,n in N,v in V}: #現場での完了時刻と基地へ戻る時刻の関係
z_end[s,v,n]+z_travel[s,v,n]==z_return[s,v,n]-z_dis[s,v,n];

subject to C11{s in S,n in N,v in V}: #出発前の準備時間の制限
z_dispatch[s,v,n]-sum{p in P}x[s,p,v,n]*t_call[s,p]>=sum{p in P}x[s,p,v,n]*t_setup[s,j];

subject to C12{s in S,n in N,v in V}: #到着時刻と通報時刻の差を表す
z_delay[s,v,n]==z_arrival[s,v,n]-sum{p in P}x[s,p,v,n]*t_call[s,p];

subject to C13{s in S,p in P,v in V,n in N,v1 in V,n1 in N:v!=v1&&demand[s,p]==2}: #到着時刻と通報時刻の差を表す
z_dis[s,v,n]>=z_arrival[s,v,n]-z_arrival[s,v1,n1]-(1-x[s,p,v,n])*1440-(1-x[a,j,v1,n1])*1440;

